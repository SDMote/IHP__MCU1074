# MCU1074-main

This directory contains all the configuration and source files used to run the physical implementation of this IP with LibreLane.

Directory `rtl` includes all Verilog and SystemVerilog source files.

Directory `custom` includes IO cells and a memory macro which are customized versions of the nes available in the IHP-SG13G2 Open PDK.


To reproduce the physical implementation, you need to copy these files into a project directory.
Your project structure should be something like this:

```
📁 librelane/
├── 📁 designs/
│   └── 📁 mcu1074/
│       ├── config.yaml
│       ├── pad.tcl
│       ├── pdn.tcl
│       ├── constraint.sdc
│       ├── 📁 custom/
│       │   └── <copy custom macro files here>
│       └── 📁 src/
│           └── <copy rtl files here>
```