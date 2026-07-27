/*-------------------------------------------------------------------------------------------------
-- File Name    : hdmi_tx.h
-- Description  : HDMI TX driver header - InfoFrame, DRM/HDR, I2C/SCDC control
-- Author       : India Solutions Team
-- COPYRIGHT 2024 BY MICROCHIP
-------------------------------------------------------------------------------------------------*/

#ifndef HDMI_TX_H_
#define HDMI_TX_H_

#include "../platform/drivers/fpga_ip/CoreI2C/core_i2c.h"
#include "../platform/drivers/fpga_ip/CoreGPIO/core_gpio.h"

/*-----------------------------------------------------------------------------
 * I2C Device Addresses
 *---------------------------------------------------------------------------*/
#define I2C_MUX_ADDR            (0xE0 >> 1)
#define IO_EXP_ADDR             (0x40 >> 1)
#define I2C_HDMI_OUT_ADDR       (0x72 >> 1)
#define I2C_HDMI_IN_ADDR        (0x98 >> 1)
#define I2C_VCS_ADDR            (0xCA >> 1)
#define IIC_HDMI_OUT_CONFIG_LEN (41)

/*-----------------------------------------------------------------------------
 * Public Function Prototypes
 *---------------------------------------------------------------------------*/

/* Initialization */
void HDMI_I2C_INIT(void);
void HDMI_tx_init(void);

/* Scrambler Control (HDMI 2.0) */
void hdmi2p0_scambler_en(void);
void hdmi2p0_scambler_disable(void);

/* SCDC Functions */
void i2c_write_read_hdmi_tx_source_version(uint8_t wr_len, uint8_t rd_len);
void i2c_write_read_hdmi_tx_scdc(uint8_t wr_len, uint8_t rd_len);
void i2c_write_read_hdmi_tx_scdc_scr(uint8_t wr_len, uint8_t rd_len);
void i2c_write_read_hdmi_tx_scdc_clk(uint8_t wr_len, uint8_t rd_len);

/* AVI InfoFrame */
void hdmitx_avi_update_for_sdr_content(uint8_t color_format, uint8_t vic, uint8_t pixel_rep);
void hdmitx_avi_update_for_hdr_content(uint8_t color_format, uint8_t vic, uint8_t pixel_rep);
void hdmitx_avi_vic_colorformat(uint8_t color_format, uint8_t vic, uint8_t pixel_rep);
void bridge_gcp_rx_to_tx(uint8_t vic_code, uint8_t color_format,uint8_t pix_width,uint8_t sdi_speed);
/* DRM InfoFrame */
void hdmitx_disable_drm(void);

#endif /* HDMI_TX_H_ */
