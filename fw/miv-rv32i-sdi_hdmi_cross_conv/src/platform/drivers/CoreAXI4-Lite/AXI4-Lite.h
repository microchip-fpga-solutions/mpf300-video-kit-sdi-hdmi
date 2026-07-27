/*-------------------------------------------------------------------------------------------------
-- File Name    : AXI4-Lite.h
-- Description  : AXI4-Lite bus access functions
-- Author       : India Solutions Team
-- COPYRIGHT 2021 BY MICROCHIP
-------------------------------------------------------------------------------------------------*/

#ifndef AXI4_LITE_H_
#define AXI4_LITE_H_

#include <stdint.h>

/*-----------------------------------------------------------------------------
 * HDMI TX Register Addresses
 *---------------------------------------------------------------------------*/
#define SCRAMBLER_IP_EN             0x71000000
#define XCVR_DATA_LANE_0_SEL        0x71000004
#define HPD                         0x71000008
#define RESET_XCVR                  0x7100000C
#define LINK_PATTERN_EN             0x71000010
#define GAP_CH_EN                   0x71000014
#define FRL_EN                      0x71000018

/* AVI InfoFrame Registers */
#define HDMITX_AVI_REG1             0x71000020
#define HDMITX_AVI_REG2             0x71000024
#define HDMITX_AVI_REG3             0x71000028
#define HDMITX_AVI_REG4             0x7100002C
#define HDMITX_GCP_REG1             0x7100001C
/* DRM (HDR) InfoFrame Registers */
#define HDMITX_DRM_REG1             0x71000030
#define HDMITX_DRM_REG2             0x71000034
#define HDMITX_DRM_REG3             0x71000038
#define HDMITX_DRM_REG4             0x7100003C
#define HDMITX_DRM_REG5             0x71000040
#define HDMITX_DRM_REG6             0x71000044
#define HDMITX_DRM_REG7             0x71000048

/*-----------------------------------------------------------------------------
 * Function Prototypes
 *
 * NOTE: Return types are NOT volatile. The volatile qualifier applies to the
 * pointer used internally for the memory-mapped access, not to the returned
 * value itself. Once read from hardware, it's just a normal uint32_t.
 *---------------------------------------------------------------------------*/

/**
 * axi4literead - Read 32-bit value from memory-mapped register
 * @param address: Register address
 * @return: Value read from register
 */
uint32_t axi4literead(uint32_t address);

/**
 * axi4litewrite - Write 32-bit value to memory-mapped register
 * @param address: Register address
 * @param data: Value to write
 */
void axi4litewrite(uint32_t address, uint32_t data);

#endif /* AXI4_LITE_H_ */
