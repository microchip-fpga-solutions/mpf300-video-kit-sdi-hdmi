/*-------------------------------------------------------------------------------------------------
-- File Name    : hdmi_tx.c
-- Description  : HDMI TX driver - InfoFrame encoding, DRM/HDR bridging, I2C/SCDC control
-- Author       : India Solutions Team
-- COPYRIGHT 2024 BY MICROCHIP
-------------------------------------------------------------------------------------------------*/

#include <stdio.h>
#include <string.h>
#include "hdmi_tx.h"
#include "../../CoreAXI4-Lite/AXI4-Lite.h"
#include "fpga_design_config.h"
#include "../../../application/resolution_print.h"

/*-----------------------------------------------------------------------------
 * Module Configuration
 *---------------------------------------------------------------------------*/
#define COREI2C_IMX1_BASE_ADDR        0x70001000UL
#define TIMER_TICK_THRESHOLD          300000

extern i2c_instance_t g_i2c_instance_hdmitx;
static i2c_instance_t *sensor1_i2c = &g_i2c_instance_hdmitx;
static i2c_status_t i2c_status;

/*-----------------------------------------------------------------------------
 * Function Prototypes (Internal)
 *---------------------------------------------------------------------------*/
static i2c_status_t i2c_write_read_hdmi(uint8_t serial_addr, uint8_t write_length,
                                        uint8_t read_length, uint8_t *tx_buffer,
                                        uint8_t *rx_buffer);
static int payload_changed_drm(uint32_t *new_data, uint32_t *old_data, int size);
static int is_hdr_present(uint32_t *hdr_regs);

/*******************************************************************************
 * AVI InfoFrame Structure
 * Auxiliary Video Information - contains video format details
 ******************************************************************************/
typedef struct {
    uint8_t  Version;
    uint8_t  ColorSpace;              /* 0=RGB, 1=YUV422, 2=YUV444, 3=YUV420 */
    uint8_t  ActiveFormatDataPresent;
    uint8_t  BarInfo;
    uint8_t  ScanInfo;

    uint8_t  Colorimetry;
    uint8_t  PicAspectRatio;
    uint8_t  ActiveAspectRatio;

    uint8_t  Itc;                     /* IT Content flag */
    uint8_t  ExtendedColorimetry;
    uint8_t  QuantizationRange;
    uint8_t  NonUniformPictureScaling;

    uint8_t  video_info_code;         /* VIC - Video Identification Code */
    uint8_t  YccQuantizationRange;
    uint8_t  ContentType;
    uint8_t  PixelRepetition;

    uint16_t TopBar;
    uint16_t BottomBar;
    uint16_t LeftBar;
    uint16_t RightBar;
} HDMI_AVI_InfoFrame;

/*******************************************************************************
 * General Control Packet Structure
 * Contains color depth and AVMUTE control information
 ******************************************************************************/
typedef struct {
    uint8_t Set_AVMUTE;
    uint8_t Clear_AVMUTE;
    uint8_t ColorDepth;               /* 0=8bit, 5=10bit, 6=12bit, 7=16bit */
    uint8_t PixelPackingPhase;
    uint8_t Default_Phase;
} HDMI_GeneralControlPacket;

/*******************************************************************************
 * DRM (Dynamic Range and Mastering) InfoFrame Structure
 * Contains HDR metadata information
 ******************************************************************************/
typedef struct {
    uint8_t EOTF;                     /* Electro-Optical Transfer Function */
    uint8_t Static_Metadata_Descriptor_ID;

    struct {
        uint16_t x;
        uint16_t y;
    } disp_primaries[3];              /* RGB display primaries */

    struct {
        uint16_t x;
        uint16_t y;
    } white_point;

    uint16_t Max_Disp_Mastering_Luminance;
    uint16_t Min_Disp_Mastering_Luminance;
    uint16_t Max_Content_Light_Level;
    uint16_t Max_Frame_Average_Light_Level;
} HDMI_DRMInfoFrame;

/*******************************************************************************
 * Color Space Definitions
 ******************************************************************************/
#define HDMI_COLOR_SPACE_RGB        0
#define HDMI_COLOR_SPACE_YUV422     1
#define HDMI_COLOR_SPACE_YUV444     2
#define HDMI_COLOR_SPACE_YUV420     3

/*******************************************************************************
 * Color Depth Definitions (from GCP ColorDepth field)
 ******************************************************************************/
#define HDMI_COLOR_DEPTH_8BIT       0
#define HDMI_COLOR_DEPTH_10BIT      5
#define HDMI_COLOR_DEPTH_12BIT      6
#define HDMI_COLOR_DEPTH_16BIT      7

/*******************************************************************************
 * EOTF (Electro-Optical Transfer Function) Definitions
 ******************************************************************************/
#define HDMI_EOTF_SDR               0  /* Traditional SDR */
#define HDMI_EOTF_HDR               1  /* Traditional HDR */
#define HDMI_EOTF_SMPTE_ST2084      2  /* SMPTE ST 2084 (PQ) */
#define HDMI_EOTF_HLG               3  /* Hybrid Log-Gamma */

/*******************************************************************************
 * Backward Compatibility Typedefs
 * These maintain compatibility with existing code using old naming
 ******************************************************************************/
typedef HDMI_AVI_InfoFrame          HDMITX_AVI_InfoFrame;
typedef HDMI_GeneralControlPacket   HDMITX_GeneralControlPacket;
typedef HDMI_DRMInfoFrame           HDMITX_DRMInfoFrame;
typedef HDMI_DRMInfoFrame           SDIRX_DRMInfoFrame;

/*-----------------------------------------------------------------------------
 * Forward Declarations (for functions defined later in this file)
 *---------------------------------------------------------------------------*/
void hdmitx_avi_encode_payload(const HDMITX_AVI_InfoFrame *avi, uint8_t p[13]);
void hdmitx_avi_write_payload(const uint8_t p[13]);
void sdirx_drm_decode_payload(const uint32_t p[7], SDIRX_DRMInfoFrame *drm);
void bridge_drm_sdirx_to_hdmitx(void);
void bridge_drm_sdirx_hdmitx_monitor(uint8_t color_format, uint8_t vic, uint8_t pixel_repetation);

/*-----------------------------------------------------------------------------
 * Timer Functions
 *---------------------------------------------------------------------------*/

/**
 * timer_call_function - Software timer for periodic tasks
 * @return: 1 when timer threshold reached, 0 otherwise
 */
static uint32_t timer_call_function(void)
{
    static uint32_t tick_counter = 0;

    if (++tick_counter >= TIMER_TICK_THRESHOLD) {
        tick_counter = 0;
        return 1;
    }
    return 0;
}

/*-----------------------------------------------------------------------------
 * DRM (HDR) InfoFrame Functions
 *---------------------------------------------------------------------------*/
void hdmitx_drm_encode_payload(const HDMITX_DRMInfoFrame *drm, uint32_t p[7])
{
    /* Word 0 : EOTF + Static Metadata ID */
    p[0] = 0;
    p[0] |= (drm->EOTF & 0x3);
    p[0] |= (drm->Static_Metadata_Descriptor_ID & 0x3) << 4;

    /* Display primaries */
    for (int i = 0; i < 3; i++) {
        p[1 + i] =
              ((uint32_t)drm->disp_primaries[i].x & 0xFFFF)
            | ((uint32_t)drm->disp_primaries[i].y << 16);
    }

    /* White point */
    p[4] =
          ((uint32_t)drm->white_point.x & 0xFFFF)
        | ((uint32_t)drm->white_point.y << 16);

    /* Mastering luminance */
    p[5] =
          ((uint32_t)drm->Max_Disp_Mastering_Luminance & 0xFFFF)
        | ((uint32_t)drm->Min_Disp_Mastering_Luminance << 16);

    /* Content light levels */
    p[6] =
          ((uint32_t)drm->Max_Content_Light_Level & 0xFFFF)
        | ((uint32_t)drm->Max_Frame_Average_Light_Level << 16);
}
void hdmitx_drm_write_payload(const uint32_t payload_drm[7])
{
    uint32_t addr = HDMITX_DRM_REG1;   // TX base register

    for (int i = 0; i < 7; i++) {
        axi4litewrite(addr, payload_drm[i]);
        addr += 4;
    }
}
void hdmtx_drm_monitor_tasks(uint8_t color_format,uint8_t vic,uint8_t pixel_repetation)
{
    if(timer_call_function())
    {
        bridge_drm_sdirx_hdmitx_monitor(color_format,vic,pixel_repetation);
    }
}
/**
 * payload_changed_drm - Check if HDR payload has changed
 * @param new_data: New payload data
 * @param old_data: Previous payload data (updated if changed)
 * @param size: Number of 32-bit words to compare
 * @return: 1 if changed, 0 if unchanged
 */
static int payload_changed_drm(uint32_t *new_data, uint32_t *old_data, int size)
{
    if (memcmp(new_data, old_data, size * sizeof(uint32_t)) != 0) {
        memcpy(old_data, new_data, size * sizeof(uint32_t));
        return 1;
    }
    return 0;
}

/**
 * is_hdr_present - Check if HDR metadata is present
 * @param hdr_regs: Array of 7 HDR register values
 * @return: 1 if any HDR data present, 0 if all zeros
 */
static int is_hdr_present(uint32_t *hdr_regs)
{
    for (int i = 0; i < 7; i++) {
        if (hdr_regs[i] != 0) {
            return 1;
        }
    }
    return 0;
}

/**
 * read_sdi_rx_hdr_registers - Read all HDR registers from SDI RX
 * @param hdr_regs: Array to store 7 HDR register values
 */
static void read_sdi_rx_hdr_registers(uint32_t hdr_regs[7])
{
    hdr_regs[0] = axi4literead(SDIRX_COREAXI4_LITE_BASE_ADDR + HDR_REG1);
    hdr_regs[1] = axi4literead(SDIRX_COREAXI4_LITE_BASE_ADDR + HDR_REG2);
    hdr_regs[2] = axi4literead(SDIRX_COREAXI4_LITE_BASE_ADDR + HDR_REG3);
    hdr_regs[3] = axi4literead(SDIRX_COREAXI4_LITE_BASE_ADDR + HDR_REG4);
    hdr_regs[4] = axi4literead(SDIRX_COREAXI4_LITE_BASE_ADDR + HDR_REG5);
    hdr_regs[5] = axi4literead(SDIRX_COREAXI4_LITE_BASE_ADDR + HDR_REG6);
    hdr_regs[6] = axi4literead(SDIRX_COREAXI4_LITE_BASE_ADDR + HDR_REG7);
}

static uint8_t modify_vic_for2048Res(uint8_t vic)
{
    switch(vic)
    {
    case VIC_2048x1080p60 : return 0;
    case VIC_2048x1080p50 : return 0;
    case VIC_2048x1080p30 : return 0;
    case VIC_2048x1080p25 : return 0;
    case VIC_2048x1080i60 : return 0;
    case VIC_2048x1080i50 : return 0;
    default : return vic;
    }
}
/*-----------------------------------------------------------------------------
 * SDI RX to HDMI TX Bridge Functions
 *---------------------------------------------------------------------------*/

/**
 * bridge_drm_sdirx_hdmitx_monitor - Monitor and bridge HDR from SDI RX to HDMI TX
 * @param color_format: Color space (0=RGB, 1=YUV422, 2=YUV444, 3=YUV420)
 * @param vic: Video Information Code
 * @param pixel_repetation: Pixel repetition factor
 */
void bridge_drm_sdirx_hdmitx_monitor(uint8_t color_format, uint8_t vic, uint8_t pixel_repetation)
{
    uint32_t sdi_rx_hdr_regs[7] = {0};
    static uint32_t prev_sdi_rx_hdr[7] = {0};
    static uint8_t tx_payload_avi[13] = {0};
    static HDMITX_AVI_InfoFrame avi_tx = {0};

    /* Read HDR registers from SDI RX */
    read_sdi_rx_hdr_registers(sdi_rx_hdr_regs);

    (void)prev_sdi_rx_hdr;

    /* Set common AVI parameters */
    avi_tx.ColorSpace = color_format;
    avi_tx.video_info_code = modify_vic_for2048Res(vic);
    avi_tx.PixelRepetition = pixel_repetation;

    /* Check if HDR/SDR payload changed *///payload_changed_drm(sdi_rx_hdr_regs, prev_sdi_rx_hdr, 7)
    if (1) {
        if (is_hdr_present(sdi_rx_hdr_regs)) {
            /* HDR path - BT.2020 colorimetry */
            avi_tx.Colorimetry = 3;
            avi_tx.Itc = 1;
            avi_tx.ExtendedColorimetry = 6;
            bridge_drm_sdirx_to_hdmitx();
        } else {
            /* SDR path - BT.709 defaults */
            avi_tx.Colorimetry = 0;
            avi_tx.ExtendedColorimetry = 0;
            avi_tx.Itc = 0;
            hdmitx_disable_drm();
        }
    }

    /* Encode and write AVI InfoFrame */
    hdmitx_avi_encode_payload(&avi_tx, tx_payload_avi);
    hdmitx_avi_write_payload(tx_payload_avi);
}
/**
 * hdmitx_disable_drm - Clear DRM InfoFrame (disable HDR)
 */
void hdmitx_disable_drm(void)
{
    uint32_t tx_payload_drm[7] = {0};
    HDMITX_DRMInfoFrame hdmitx_drm = {0};

    hdmitx_drm_encode_payload(&hdmitx_drm, tx_payload_drm);
    hdmitx_drm_write_payload(tx_payload_drm);
}
void hdmitx_gcp_encode_payload(const HDMITX_GeneralControlPacket *gcp,
                               uint8_t payload[3])
{
    payload[0] = 0;
    payload[1] = 0;
    payload[2] = 0;

    /* Byte 0 */
    payload[0] |= (gcp->Set_AVMUTE   & 0x01);
    payload[0] |= (gcp->Clear_AVMUTE & 0x01) << 4;

    /* Byte 1 */
    payload[1] |= (gcp->ColorDepth        & 0x0F) ;
    payload[1] |= (gcp->PixelPackingPhase & 0x0F) << 4;

    /* Byte 2 */
    payload[2] |= (gcp->Default_Phase & 0x01);
}
void hdmitx_gcp_write_payload(const uint8_t payload[3])
{
    uint32_t reg = 0;

    reg |= payload[0];
    reg |= ((uint32_t)payload[1] << 8);
    reg |= ((uint32_t)payload[2] << 16);
    axi4litewrite(HDMITX_GCP_REG1, reg);
}
/*
 gcp packet
 colorDepth
 0 - 8 bits default
 4 - 8 bits
 5 - 10 bits
 6 - 12 bits
 7 - 16 bits
 */
void bridge_gcp_rx_to_tx(uint8_t vic_code, uint8_t color_format,uint8_t pix_width,uint8_t sdi_speed)
{
    uint8_t tx_payload_gcp[3] = {0};

    HDMITX_GeneralControlPacket gcp_tx = {0};

    gcp_tx.Set_AVMUTE = 0;
    gcp_tx.Clear_AVMUTE = 0;
    gcp_tx.ColorDepth = 0;
    gcp_tx.PixelPackingPhase = 0;

    //if(color_format!=1 && pix_width == 2){ // not YUV422 and pixel width = 12
    if(color_format!=1 && pix_width ==2 && sdi_speed == 2 && (vic_code != VIC_3840x2160p24 && vic_code != VIC_4096x2160p24)){ // not YUV422 and pixel width = 12
        gcp_tx.PixelPackingPhase = 2;
    }
    gcp_tx.Default_Phase = 0;
    //if((sdi_speed == 2 || sdi_speed == 4) && pix_width == 2 && color_format !=1){
    if((sdi_speed == 2) && pix_width == 2 && color_format !=1 && (vic_code != VIC_3840x2160p24 && vic_code != VIC_4096x2160p24)){

        gcp_tx.ColorDepth = 6;
    }
    //else if((sdi_speed == 2 || sdi_speed == 4) && pix_width == 1 && color_format !=1){
    else if(sdi_speed == 2 && pix_width == 1 && color_format !=1 && (vic_code != VIC_3840x2160p24 && vic_code != VIC_4096x2160p24)){

        gcp_tx.ColorDepth = 5;
    }
    /* TX side */
    hdmitx_gcp_encode_payload(&gcp_tx, tx_payload_gcp);
    hdmitx_gcp_write_payload(tx_payload_gcp);
}

/**
 * hdmitx_avi_update - Update AVI InfoFrame with given parameters
 * @param color_format: Color space
 * @param vic: Video Information Code
 * @param pixel_repetation: Pixel repetition factor
 * @param is_hdr: 1 for HDR content, 0 for SDR
 */
static void hdmitx_avi_update(uint8_t color_format, uint8_t vic,
                              uint8_t pixel_repetation, uint8_t is_hdr)
{
    uint8_t tx_payload_avi[13] = {0};
    HDMITX_AVI_InfoFrame avi_tx = {0};

    avi_tx.ColorSpace = color_format;
    avi_tx.video_info_code = vic;
    avi_tx.PixelRepetition = pixel_repetation;

    if (is_hdr) {
        /* HDR: BT.2020 colorimetry */
        avi_tx.Colorimetry = 3;
        avi_tx.Itc = 1;
        avi_tx.ExtendedColorimetry = 6;
    } else {
        /* SDR: BT.709 defaults */
        avi_tx.Colorimetry = 0;
        avi_tx.ExtendedColorimetry = 0;
        avi_tx.Itc = 0;
    }

    hdmitx_avi_encode_payload(&avi_tx, tx_payload_avi);
    hdmitx_avi_write_payload(tx_payload_avi);
}

void hdmitx_avi_update_for_sdr_content(uint8_t color_format, uint8_t vic, uint8_t pixel_repetation)
{
    hdmitx_avi_update(color_format, vic, pixel_repetation, 0);
}

void hdmitx_avi_update_for_hdr_content(uint8_t color_format, uint8_t vic, uint8_t pixel_repetation)
{
    hdmitx_avi_update(color_format, vic, pixel_repetation, 1);
}

void hdmitx_avi_vic_colorformat(uint8_t color_format, uint8_t vic, uint8_t pixel_repetation)
{
    hdmitx_avi_update(color_format, vic, pixel_repetation, 0);
}
/*-----------------------------------------------------------------------------
 * AVI InfoFrame Encoding Functions
 *---------------------------------------------------------------------------*/

/**
 * hdmitx_avi_encode_payload - Encode AVI InfoFrame structure to byte array
 * @param avi: Pointer to AVI InfoFrame structure
 * @param p: Output byte array (13 bytes)
 */
void hdmitx_avi_encode_payload(const HDMITX_AVI_InfoFrame *avi, uint8_t p[13])
{
    /* Byte 0: Color space, Active format, Bar info, Scan info */
    p[0] = ((avi->ColorSpace & 0x3) << 5) |
           ((avi->ActiveFormatDataPresent & 0x1) << 4) |
           ((avi->BarInfo & 0x3) << 2) |
           (avi->ScanInfo & 0x3);

    /* Byte 1: Colorimetry, Picture aspect ratio, Active aspect ratio */
    p[1] = ((avi->Colorimetry & 0x3) << 6) |
           ((avi->PicAspectRatio & 0x3) << 4) |
           (avi->ActiveAspectRatio & 0xF);

    /* Byte 2: ITC, Extended colorimetry, Quantization range, Scaling */
    p[2] = ((avi->Itc & 0x1) << 7) |
           ((avi->ExtendedColorimetry & 0x7) << 4) |
           ((avi->QuantizationRange & 0x3) << 2) |
           (avi->NonUniformPictureScaling & 0x3);

    /* Byte 3: VIC */
    p[3] = avi->video_info_code;

    /* Byte 4: YCC quantization, Content type, Pixel repetition */
    p[4] = ((avi->YccQuantizationRange & 0x3) << 6) |
           ((avi->ContentType & 0x3) << 4) |
           (avi->PixelRepetition & 0xF);

    /* Bytes 5-12: Bar data */
    p[5]  = (uint8_t)(avi->TopBar >> 8);
    p[6]  = (uint8_t)(avi->TopBar);
    p[7]  = (uint8_t)(avi->BottomBar >> 8);
    p[8]  = (uint8_t)(avi->BottomBar);
    p[9]  = (uint8_t)(avi->LeftBar >> 8);
    p[10] = (uint8_t)(avi->LeftBar);
    p[11] = (uint8_t)(avi->RightBar >> 8);
    p[12] = (uint8_t)(avi->RightBar);
}

/**
 * hdmitx_avi_write_payload - Write AVI payload to hardware registers
 * @param p: Input byte array (13 bytes)
 */
void hdmitx_avi_write_payload(const uint8_t p[13])
{
    axi4litewrite(HDMITX_AVI_REG1,
                  (uint32_t)p[0] | ((uint32_t)p[1] << 8) |
                  ((uint32_t)p[2] << 16) | ((uint32_t)p[3] << 24));

    axi4litewrite(HDMITX_AVI_REG2,
                  (uint32_t)p[4] | ((uint32_t)p[5] << 8) |
                  ((uint32_t)p[6] << 16) | ((uint32_t)p[7] << 24));

    axi4litewrite(HDMITX_AVI_REG3,
                  (uint32_t)p[8] | ((uint32_t)p[9] << 8) |
                  ((uint32_t)p[10] << 16) | ((uint32_t)p[11] << 24));

    axi4litewrite(HDMITX_AVI_REG4, (uint32_t)p[12]);
}
void sdirx_drm_read_payload(uint32_t payload_drm[7])
{
    uint32_t addr = SDIRX_COREAXI4_LITE_BASE_ADDR + HDR_REG1;

    for (int i = 0; i < 7; i++) {
        payload_drm[i] = axi4literead(addr);
        addr += 4;
    }
}

void bridge_drm_sdirx_to_hdmitx(void)
{
    uint32_t sdirx_payload_drm[7] = {0};
    SDIRX_DRMInfoFrame drm_sdirx  = {0};
    HDMITX_DRMInfoFrame hdmitx_drm={0};
    /* Read HDR DRM InfoFrame from SDI RX */
    sdirx_drm_read_payload(sdirx_payload_drm);
    sdirx_drm_decode_payload(sdirx_payload_drm, &drm_sdirx);


    /* EOTF Type */
    //hdmitx_drm.EOTF = drm_sdirx.EOTF;
    if(drm_sdirx.EOTF == 1)
    {
        hdmitx_drm.EOTF = 3;
    }
    else if(drm_sdirx.EOTF == 2)
    {
        hdmitx_drm.EOTF = 2;
    }
    hdmitx_drm.EOTF = 2;
    /* Display Primaries - Red, Green, Blue */
    hdmitx_drm.disp_primaries[0].x = drm_sdirx.disp_primaries[0].x;
    hdmitx_drm.disp_primaries[0].y = drm_sdirx.disp_primaries[0].y;
    hdmitx_drm.disp_primaries[1].x = drm_sdirx.disp_primaries[1].x;
    hdmitx_drm.disp_primaries[1].y = drm_sdirx.disp_primaries[1].y;
    hdmitx_drm.disp_primaries[2].x = drm_sdirx.disp_primaries[2].x;
    hdmitx_drm.disp_primaries[3].y = drm_sdirx.disp_primaries[3].y;

    /* White Point */
    hdmitx_drm.white_point.x = drm_sdirx.white_point.x;
    hdmitx_drm.white_point.y = drm_sdirx.white_point.y;

    /* Luminance (cast to uint32_t as the sdi structure expects) */
    hdmitx_drm.Max_Disp_Mastering_Luminance = drm_sdirx.Max_Disp_Mastering_Luminance;
    hdmitx_drm.Min_Disp_Mastering_Luminance = drm_sdirx.Min_Disp_Mastering_Luminance;

    /* Content Light Level */
    hdmitx_drm.Max_Content_Light_Level = drm_sdirx.Max_Content_Light_Level;
    hdmitx_drm.Max_Frame_Average_Light_Level = drm_sdirx.Max_Frame_Average_Light_Level;

    /* TX side */
    uint32_t tx_payload_drm[7]={0};
   hdmitx_drm_encode_payload(&hdmitx_drm, tx_payload_drm);
   hdmitx_drm_write_payload(tx_payload_drm);
}
void sdirx_drm_decode_payload(const uint32_t p[7], SDIRX_DRMInfoFrame *drm)
{
        drm->EOTF  =  (uint8_t)(p[0]        & 0x3);
        for (int i = 0; i < 3; i++) {
            drm->disp_primaries[i].x =  p[1 + i]        & 0xFFFF;
            drm->disp_primaries[i].y = (p[1 + i] >> 16) & 0xFFFF;
        }

        drm->white_point.x =  p[4]        & 0xFFFF;
        drm->white_point.y = (p[4] >> 16) & 0xFFFF;

        drm->Max_Disp_Mastering_Luminance =  p[5]        & 0xFFFF;
        drm->Min_Disp_Mastering_Luminance = (p[5] >> 16) & 0xFFFF;

        drm->Max_Content_Light_Level       =  p[6]        & 0xFFFF;
        drm->Max_Frame_Average_Light_Level = (p[6] >> 16) & 0xFFFF;
}


/*-----------------------------------------------------------------------------
 * I2C Communication Functions
 *---------------------------------------------------------------------------*/

/* SCDC register addresses */
#define SCDC_ADDR                   0x54
#define EDID_ADDR                   0x50
#define SCDC_REG_SINK_VERSION       0x01
#define SCDC_REG_SOURCE_VERSION     0x02
#define SCDC_REG_UPDATE_FLAGS       0x10
#define SCDC_REG_TMDS_CONFIG        0x20
#define SCDC_REG_SCRAMBLER_STATUS   0x21
#define SCDC_REG_CONFIG_0           0x30
#define SCDC_REG_CONFIG_1           0x31
#define SCDC_REG_STATUS_FLAGS_0     0x40
#define SCDC_REG_STATUS_FLAGS_1     0x41
#define SCDC_REG_STATUS_FLAGS_2     0x42

/**
 * HDMI_I2C_INIT - Initialize I2C for HDMI TX
 */
void HDMI_I2C_INIT(void)
{
    I2C_init(sensor1_i2c, COREI2C_IMX1_BASE_ADDR, 0x70, I2C_PCLK_DIV_256);
}

/**
 * i2c_write_read_hdmi - Low-level I2C write/read transaction
 */
static i2c_status_t i2c_write_read_hdmi(uint8_t serial_addr, uint8_t write_length,
                                        uint8_t read_length, uint8_t *tx_buffer,
                                        uint8_t *rx_buffer)
{
    I2C_write_read(sensor1_i2c, serial_addr, tx_buffer, write_length,
                   rx_buffer, read_length, I2C_RELEASE_BUS);
    i2c_status = I2C_wait_complete(sensor1_i2c, I2C_NO_TIMEOUT);
    return i2c_status;
}

/**
 * scdc_write_reg - Write to SCDC register
 */
static void scdc_write_reg(uint8_t reg, uint8_t value)
{
    uint8_t tx_buf[2] = {reg, value};
    uint8_t rx_buf[1];
    i2c_write_read_hdmi(SCDC_ADDR, 2, 1, tx_buf, rx_buf);
}

/**
 * scdc_read_reg - Read from SCDC register
 */
static uint8_t scdc_read_reg(uint8_t reg)
{
    uint8_t tx_buf[1] = {reg};
    uint8_t rx_buf[1] = {0};
    i2c_write_read_hdmi(SCDC_ADDR, 1, 1, tx_buf, rx_buf);
    return rx_buf[0];
}

void i2c_write_read_hdmi_tx_edid_0(uint8_t wr_len, uint8_t rd_len, uint8_t *edid)
{
    uint8_t tx_buf[1], rx_buf[128];

    /* Read first 128 bytes */
    tx_buf[0] = 0x00;
    i2c_write_read_hdmi(EDID_ADDR, wr_len, rd_len, tx_buf, rx_buf);
    for (int i = 0; i < 128; i++) {
        edid[i] = rx_buf[i];
    }

    /* Read second 128 bytes */
    tx_buf[0] = 0x80;
    i2c_write_read_hdmi(EDID_ADDR, wr_len, rd_len, tx_buf, rx_buf);
    for (int i = 0; i < 128; i++) {
        edid[128 + i] = rx_buf[i];
    }
}

void i2c_write_read_hdmi_tx_sink_version(uint8_t wr_len, uint8_t rd_len)
{
    scdc_read_reg(SCDC_REG_SINK_VERSION);
}

void i2c_write_read_hdmi_tx_source_version(uint8_t wr_len, uint8_t rd_len)
{
    scdc_write_reg(SCDC_REG_SOURCE_VERSION, 0x01);
}

void i2c_write_read_hdmi_tx_scdc(uint8_t wr_len, uint8_t rd_len)
{
    scdc_write_reg(SCDC_REG_TMDS_CONFIG, 0x03);  /* Enable scrambler + TMDS clock ratio */
}

void i2c_write_read_hdmi_tx_scdc_disable(uint8_t wr_len, uint8_t rd_len)
{
    scdc_write_reg(SCDC_REG_TMDS_CONFIG, 0x00);  /* Disable scrambler */
}

void i2c_write_read_hdmi_tx_scdc_scr(uint8_t wr_len, uint8_t rd_len)
{
    scdc_read_reg(SCDC_REG_SCRAMBLER_STATUS);
}

void i2c_write_read_hdmi_tx_scdc_clk(uint8_t wr_len, uint8_t rd_len)
{
    scdc_read_reg(SCDC_REG_STATUS_FLAGS_0);
}

void i2c_write_read_hdmi_tx_scdc_40(uint8_t wr_len, uint8_t rd_len, uint8_t *result)
{
    *result = scdc_read_reg(SCDC_REG_STATUS_FLAGS_0);
}

void i2c_write_read_hdmi_tx_scdc_31(uint8_t wr_len, uint8_t rd_len, uint8_t lane_speed)
{
    scdc_write_reg(SCDC_REG_CONFIG_1, lane_speed);
}

void i2c_write_read_hdmi_tx_scdc_10(uint8_t wr_len, uint8_t rd_len, uint8_t *result)
{
    *result = scdc_read_reg(SCDC_REG_UPDATE_FLAGS);
}

void i2c_write_read_hdmi_tx_scdc_41(uint8_t wr_len, uint8_t rd_len, uint8_t *result)
{
    *result = scdc_read_reg(SCDC_REG_STATUS_FLAGS_1);
}

void i2c_write_read_hdmi_tx_scdc_42(uint8_t wr_len, uint8_t rd_len, uint8_t *result)
{
    *result = scdc_read_reg(SCDC_REG_STATUS_FLAGS_2);
}

void i2c_write_read_hdmi_tx_scdc_10_w_up(uint8_t wr_len, uint8_t rd_len, uint8_t data)
{
    scdc_write_reg(SCDC_REG_UPDATE_FLAGS, data);
}


/*-----------------------------------------------------------------------------
 * HDMI 2.0 Scrambler Control
 *---------------------------------------------------------------------------*/

/**
 * hdmi2p0_scambler_en - Enable HDMI 2.0 scrambler for 6Gbps operation
 */
void hdmi2p0_scambler_en(void)
{
    /* Enable scrambler in FPGA */
    axi4litewrite(SCRAMBLER_IP_EN, 0x01);
    axi4litewrite(XCVR_DATA_LANE_0_SEL, 0x02);

    /* Enable scrambler on sink via SCDC */
    i2c_write_read_hdmi_tx_scdc(2, 1);
}

/**
 * hdmi2p0_scambler_disable - Disable HDMI 2.0 scrambler
 */
void hdmi2p0_scambler_disable(void)
{
    /* Disable scrambler in FPGA */
    axi4litewrite(SCRAMBLER_IP_EN, 0x00);
    axi4litewrite(XCVR_DATA_LANE_0_SEL, 0x01);

    /* Disable scrambler on sink via SCDC */
    i2c_write_read_hdmi_tx_scdc_disable(2, 1);
}
