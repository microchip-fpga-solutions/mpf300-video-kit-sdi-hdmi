# Firmware — SDI/HDMI Bidirectional Converter Design

This folder contains the SoftConsole firmware project that runs on the MIV_RV32 (Mi-V RISC-V®) soft processor inside the PolarFire® FPGA. The firmware performs the control-plane management for the SDI/HDMI Bidirectional Converter Design with Dynamic Rate Support on the PolarFire Video Kit (MPF300T-1FCG1152E).

The firmware is not required for programming the device — the prebuilt `.hex` image is preloaded into the FPGA spi_flash inside the `.job` file distributed on the [GitHub Releases](https://github.com/microchip-fpga-solutions/mpf300-video-kit-sdi-hdmi/releases) page. This folder is provided so the firmware can be rebuilt, modified, and re-debugged from source.

## Firmware Responsibilities

The firmware manages both video conversion paths:

- **SDI → HDMI path**: Reads the incoming SDI data rate from the M23544G re-clocker over SPI, configures the SDI RX transceiver and IP to the detected rate, and configures the HDMI TX transceiver and IP to match.
- **HDMI → SDI path**: Handles interrupt-driven HDMI RX resolution/format detection, configures the color-conversion block via GPIO, and configures the SDI TX transceiver and IP to the required data rate.
- **Diagnostics**: Prints the detected data rate and video resolution over UART (115200 8N1) via CoreUARTapb.

## Validation Environment

| Tool | Version |
| --- | --- |
| SoftConsole | **2022.2** |
| Mi-V soft processor | MIV_RV32 v3.1.200 (base RV32I ISA) |
| Toolchain | GNU RISC-V Cross (bundled with SoftConsole 2022.2) |

## Directory Structure

```
fw/
 ├── .gitignore                              Excludes build artefacts and workspace metadata
 ├── .metadata                               
 ├── README.md                               Generic Mi-V soft-processor project notes
 └── miv-rv32i-sdi_hdmi_cross_conv/          Firmware project
     ├── .project / .cproject / .settings/   Eclipse/SoftConsole project files
     ├── miv32i-Debug/                       Prebuilt Debug output (.elf, .hex, .map, .lst)
     ├── miv32i-Release/                     Prebuilt Release build files
     └── src/
         ├── main.c                          Top-level control loop for both video paths
         ├── application/                    Resolution / rate print helpers
         ├── boards/polarfire-video-kit/     Board-specific fpga_design_config
         └── platform/
             ├── drivers/                    IP drivers (CoreGPIO, CoreI2C, CoreSPI,
             │                                CoreUARTapb, CoreAXI4-Lite, HDMI, SDI)
             ├── hal/                        Hardware abstraction layer
             └── miv_rv32_hal/               MIV_RV32 HAL
```

## Prerequisites

Before building the firmware, ensure the following are in place:

1. **SoftConsole v2022.2** installed on the host PC. Download from the [SoftConsole webpage](https://www.microchip.com/en-us/products/fpgas-and-plds/fpga-and-soc-design-tools/soc-fpga/softconsole).
2. **Hardware programmed** with the `.job` file (see [Appendix B: Programming with FlashPro Express](../README.md#appendix-b-programming-with-flashpro-express) in the top-level README). Debugging the firmware requires the FPGA fabric to be up.
3. **USB cable** connected to the J12 port on the PolarFire Video Kit — this exposes both the FTDI UART interface for `printf()` output and the JTAG interface used by SoftConsole for flashing and debugging.

## Building the Firmware

The `fw/` folder is a pre-configured SoftConsole workspace. To rebuild the firmware:

1. Launch **SoftConsole 2022.2**.
2. When prompted for a workspace, browse to `fw/` and click **Launch**. The `miv-rv32i-sdi_hdmi_cross_conv` project appears in the **Project Explorer** automatically.
3. Select the build configuration:
   - Right-click the project > **Build Configurations** > **Set Active** > **miv32i-Debug** (or **miv32i-Release**).
4. Build the project:
   - Right-click the project > **Build Project**.

> **Alternative — fresh workspace:** To use an isolated SoftConsole workspace, launch SoftConsole and point at any empty folder. Then in the **Project Explorer**:
>   - **File** > **Import** > **General** > **Existing Projects into Workspace** > **Next**.
>   - Set the **root directory** to `fw/miv-rv32i-sdi_hdmi_cross_conv/`.
>   - Select the `miv-rv32i-sdi_hdmi_cross_conv` project and click **Finish**.

On a successful build, the output artefacts are produced under `miv32i-Debug/` (or `miv32i-Release/`):

| Artefacts | Purpose |
| --- | --- |
| `miv-rv32i-sdi_hdmi_cross_conv.elf` | Executable used by the SoftConsole debugger |
| `miv-rv32i-sdi_hdmi_cross_conv.hex` | Intel-hex image loaded into spi_flash by Libero |

## Running / Debugging the Firmware

There are two ways to run the firmware:

### Option 1: Run from spi_flash (production)

The prebuilt `.hex` is already embedded in the `.job` file distributed on the [GitHub Releases](https://github.com/microchip-fpga-solutions/mpf300-video-kit-sdi-hdmi/releases) page. After programming the device with FlashPro Express, the firmware runs automatically from spi_flash at power-on. **LED1** blinking indicates the MIV processor is executing.

### Option 2: Debug from SoftConsole (development)

To run or debug modified firmware from SoftConsole:

1. Program the FPGA fabric with the `.job` file first (see the top-level README).
2. Connect the USB cable to J12 on the PolarFire Video Kit.
3. In SoftConsole, right-click the project and select **Debug As** > **Debug Configurations…**.
4. Under **GDB OpenOCD Debugging**, select the launch configuration provided in the project (`miv-rv32i-cxp-host miv32i-Debug.launch`).
5. Click **Debug**. SoftConsole downloads the ELF over JTAG, halts at `main`, and hands control to the debugger.

### Updating the Firmware in spi_flash

To re-embed a rebuilt `.hex` into the `.job` file for FlashPro Express distribution:

1. In Libero SoC, open the design project (see [hw/README.md](../hw/README.md)).
2. Open **Configure Design Initialization Data and Memories** and point the spi_flash client at the rebuilt `.hex`.
3. Re-run **Generate FPGA Array Data** and **Generate FlashPro Data** to produce a new `.job` file.

## UART Output

The firmware prints operational status over CoreUARTapb. To view the output, open a serial terminal (TeraTerm / MobaXterm / PuTTY) on the **FP5 Serial Converter C** COM port with the following settings:

| Setting | Value |
| --- | --- |
| Baud rate | 115200 |
| Data bits | 8 |
| Parity | None |
| Stop bits | 1 |
| Flow control | None |

Typical output includes the detected SDI or HDMI data rate and the incoming video resolution. See [Appendix C: Troubleshooting Guide](../README.md#appendix-c-troubleshooting-guide) in the top-level README for serial/UART troubleshooting.

## Support

For questions about the firmware or debugging, contact [Microchip Technical Support](https://www.microchip.com/support).
