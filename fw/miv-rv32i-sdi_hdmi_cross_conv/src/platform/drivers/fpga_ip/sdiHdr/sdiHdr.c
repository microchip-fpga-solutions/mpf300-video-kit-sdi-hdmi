/*-------------------------------------------------------------------------------------------------
-- File Name    : sdiHdr.c
-- Description  : HDR Metadata driver implementation for SDI TX
-- Author       : India Solutions Team
-- COPYRIGHT 2024 BY MICROCHIP
-------------------------------------------------------------------------------------------------*/

#include "sdiHdr.h"
#include "../hdmi_config/hdmiRxXCVRSpeed.h"

/*-----------------------------------------------------------------------------
 * Write complete HDR structure to registers
 *---------------------------------------------------------------------------*/
void drm_hdmirx_to_sditx()
{
    uint32_t rx_payload_drm[7] = {0};
    uint8_t hdmi_rx_eotf,sdi_tx_eotf;

    hdmirx_drm_read_payload(rx_payload_drm);

    hdmi_rx_eotf = rx_payload_drm[0];

    if(hdmi_rx_eotf== 1)
        sdi_tx_eotf = 3;
    else if(hdmi_rx_eotf == 3)
        sdi_tx_eotf = 1;
    else
        sdi_tx_eotf = hdmi_rx_eotf;

    axi4litewrite(SDI_COREAXI4_LITE_BASE_ADDR + SDI_HDR_REG0_ADDR,(uint32_t)sdi_tx_eotf);
    axi4litewrite(SDI_COREAXI4_LITE_BASE_ADDR + SDI_HDR_REG1_ADDR,(rx_payload_drm[1]));
    axi4litewrite(SDI_COREAXI4_LITE_BASE_ADDR + SDI_HDR_REG2_ADDR,(rx_payload_drm[2]));
    axi4litewrite(SDI_COREAXI4_LITE_BASE_ADDR + SDI_HDR_REG3_ADDR,(rx_payload_drm[3]));
    axi4litewrite(SDI_COREAXI4_LITE_BASE_ADDR + SDI_HDR_REG4_ADDR,(rx_payload_drm[4]));
    axi4litewrite(SDI_COREAXI4_LITE_BASE_ADDR + SDI_HDR_REG5_ADDR,(rx_payload_drm[5]));
    axi4litewrite(SDI_COREAXI4_LITE_BASE_ADDR + SDI_HDR_REG6_ADDR,(rx_payload_drm[6]));
}
static inline uint32_t swap_byte_pairs(uint32_t value)
{
    uint32_t byte3 = (value >> 24) & 0xFF;  // bits [31:24]
    uint32_t byte2 = (value >> 16) & 0xFF;  // bits [23:16]
    uint32_t byte1 = (value >> 8)  & 0xFF;  // bits [15:8]
    uint32_t byte0 = (value)       & 0xFF;  // bits [7:0]

    // Swap: byte3 <-> byte2, byte1 <-> byte0
    return (byte2 << 24) | (byte3 << 16) | (byte0 << 8) | byte1;

}
