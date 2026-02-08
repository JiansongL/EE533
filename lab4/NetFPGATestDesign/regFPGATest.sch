VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "spartan3a"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL outSingle
        SIGNAL inSingle
        SIGNAL inBus(7:0)
        SIGNAL outBus(7:0)
        SIGNAL XLXN_10
        SIGNAL clk
        SIGNAL XLXN_12
        SIGNAL XLXN_13
        PORT Output outSingle
        PORT Input inSingle
        PORT Input inBus(7:0)
        PORT Output outBus(7:0)
        PORT Input clk
        BEGIN BLOCKDEF fd
            TIMESTAMP 2000 1 1 10 10 10
            RECTANGLE N 64 -320 320 -64 
            LINE N 0 -128 64 -128 
            LINE N 0 -256 64 -256 
            LINE N 384 -256 320 -256 
            LINE N 80 -128 64 -144 
            LINE N 64 -112 80 -128 
        END BLOCKDEF
        BEGIN BLOCKDEF fd8ce
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -128 64 -128 
            LINE N 0 -192 64 -192 
            LINE N 0 -32 64 -32 
            LINE N 0 -256 64 -256 
            LINE N 384 -256 320 -256 
            LINE N 192 -32 64 -32 
            LINE N 192 -64 192 -32 
            LINE N 80 -128 64 -144 
            LINE N 64 -112 80 -128 
            RECTANGLE N 320 -268 384 -244 
            RECTANGLE N 0 -268 64 -244 
            RECTANGLE N 64 -320 320 -64 
        END BLOCKDEF
        BEGIN BLOCKDEF vcc
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 64 -32 64 -64 
            LINE N 64 0 64 -32 
            LINE N 96 -64 32 -64 
        END BLOCKDEF
        BEGIN BLOCKDEF gnd
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 64 -64 64 -96 
            LINE N 76 -48 52 -48 
            LINE N 68 -32 60 -32 
            LINE N 88 -64 40 -64 
            LINE N 64 -64 64 -80 
            LINE N 64 -128 64 -96 
        END BLOCKDEF
        BEGIN BLOCK XLXI_1 fd
            PIN C clk
            PIN D inSingle
            PIN Q outSingle
        END BLOCK
        BEGIN BLOCK XLXI_4 fd8ce
            PIN C clk
            PIN CE XLXN_13
            PIN CLR XLXN_12
            PIN D(7:0) inBus(7:0)
            PIN Q(7:0) outBus(7:0)
        END BLOCK
        BEGIN BLOCK XLXI_5 vcc
            PIN P XLXN_13
        END BLOCK
        BEGIN BLOCK XLXI_6 gnd
            PIN G XLXN_12
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        INSTANCE XLXI_1 816 896 R0
        BEGIN BRANCH outSingle
            WIRE 1200 640 1360 640
        END BRANCH
        IOMARKER 1360 640 outSingle R0 28
        BEGIN BRANCH inSingle
            WIRE 656 640 816 640
        END BRANCH
        IOMARKER 656 640 inSingle R180 28
        INSTANCE XLXI_4 816 1360 R0
        BEGIN BRANCH inBus(7:0)
            WIRE 656 1104 816 1104
        END BRANCH
        BEGIN BRANCH outBus(7:0)
            WIRE 1200 1104 1360 1104
        END BRANCH
        IOMARKER 1360 1104 outBus(7:0) R0 28
        IOMARKER 656 1104 inBus(7:0) R180 28
        BEGIN BRANCH clk
            WIRE 512 768 768 768
            WIRE 768 768 816 768
            WIRE 768 768 768 1232
            WIRE 768 1232 816 1232
        END BRANCH
        IOMARKER 512 768 clk R180 28
        INSTANCE XLXI_5 656 992 R0
        BEGIN BRANCH XLXN_12
            WIRE 816 1328 816 1360
        END BRANCH
        INSTANCE XLXI_6 752 1488 R0
        BEGIN BRANCH XLXN_13
            WIRE 720 992 720 1168
            WIRE 720 1168 816 1168
        END BRANCH
    END SHEET
END SCHEMATIC
