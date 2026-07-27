# Hardware — SDI/HDMI Bidirectional Converter Design

This folder contains the Tcl scripts and source files needed to regenerate the Libero® SoC project for the SDI/HDMI Bidirectional Converter Design with Dynamic Rate Support on the PolarFire® Video Kit (MPF300T-1FCG1152E).

## Validation Environment

| Tool | Version |
| --- | --- |
| Libero® SoC Design Suite | **2025.1** |
| IP core versions | As specified in [`common/common.tcl`](common/common.tcl) |

## Directory Structure

```
hw/
├── script.tcl                          Top-level Libero build script
├── common/
│   └── common.tcl                      IP-core versions, tool profiles, device info
├── src/
│   ├── 1_create_design.tcl             Instantiates and wires IP cores, imports HDL
│   ├── 2_constrain_design.tcl          Imports I/O, timing, and floorplan constraints
│   ├── 4_implement_design.tcl          Runs synthesis, place-and-route, verifies timing
│   ├── 5_program_design.tcl            Generates the FlashPro Express programming job file
│   ├── cfg/
│   │   └── SNVM_SDI_HDMI.cfg           SNVM / RAM / UPROM / SPI-flash configuration
│   ├── components/                     Per-IP configuration Tcls (SDI, HDMI, XCVR, CCC, MIV, …)
│   ├── constraints/
│   │   ├── fp_constraints.pdc          Floorplan constraints
│   │   ├── io_constraints.pdc          I/O placement and standards
│   │   ├── timing_constraints.sdc      Timing constraints
│   │   └── timing_ngmux_constraints.sdc NGMUX-specific timing exceptions
│   └── hdl/
│       ├── Debounce.v
│       ├── YUV444_to_YUV422.v
│       ├── audio_cts_mapper.v
│       └── conversion_sel_mux.v
|
```

## Running the Tcl Flow

To regenerate the Libero project from these scripts:

1. Launch Libero® SoC 2025.1.
2. Click **Project** > **Execute Script…**.
3. Click **Browse** and select `script.tcl` from this `hw/` folder.
4. Click **Run**.

After successful execution, the Libero project is created inside this folder.

## Tcl File Descriptions

| File | Purpose |
| --- | --- |
| `script.tcl` | Top-level script. Creates the Libero project directory, sets the target device (MPF300T-1FCG1152E), project name, and tool profiles, then invokes the scripts below in order to complete the full Libero design flow. |
| `common/common.tcl` | Central table of IP-core versions, tool profiles, and device information used by every downstream script. Update this file when moving to a new Libero or IP release. |
| `src/1_create_design.tcl` | Executes every core-configuration Tcl under `src/components/`, imports the HDL files from `src/hdl/`, and wires up the top-level SmartDesign. |
| `src/2_constrain_design.tcl` | Imports the constraints files from `src/constraints/` into the Libero project. |
| `src/4_implement_design.tcl` | Runs synthesis, place-and-route, and timing verification. |
| `src/5_program_design.tcl` | Generates the FlashPro Express programming job file. |

## Updating for a New Libero or IP Release

To port this design to a newer Libero SoC or IP release:

1. Update the IP core version numbers in [`common/common.tcl`](common/common.tcl).
2. Re-run the Tcl flow in the target Libero version.

If the flow fails after the update, check the following:

- **Libero-related errors** — review the Libero release notes for changes to design components, tools, or Tcl commands.
- **IP-core-related errors** — review the IP handbook and release notes for changes to configuration parameters, ports, or their functionality. Update the corresponding component Tcl under `src/components/` if the IP's configuration interface has changed.

For Tcl command syntax, see the *Libero SoC Tcl Command Reference Guide*.

## Support

For questions about the Tcl flow or the design source, contact [Microchip Technical Support](https://www.microchip.com/support).
