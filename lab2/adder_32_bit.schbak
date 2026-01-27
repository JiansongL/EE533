VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "aspartan2e"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL a(31:0)
        SIGNAL b(31:0)
        SIGNAL s(31:0)
        BEGIN SIGNAL a(7:0)
        END SIGNAL
        SIGNAL c_in
        SIGNAL b(7:0)
        SIGNAL c_out
        SIGNAL XLXN_9
        SIGNAL XLXN_10
        SIGNAL XLXN_11
        SIGNAL s(7:0)
        SIGNAL a(15:8)
        SIGNAL b(15:8)
        SIGNAL s(15:8)
        SIGNAL a(23:16)
        SIGNAL b(23:16)
        SIGNAL s(23:16)
        SIGNAL a(31:24)
        SIGNAL b(31:24)
        SIGNAL s(31:24)
        PORT Input a(31:0)
        PORT Input b(31:0)
        PORT Output s(31:0)
        PORT Input c_in
        PORT Output c_out
        BEGIN BLOCKDEF adder_8_bit
            TIMESTAMP 2026 1 27 6 1 34
            RECTANGLE N 64 -192 320 0 
            RECTANGLE N 0 -172 64 -148 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -96 0 -96 
            LINE N 64 -32 0 -32 
            RECTANGLE N 320 -172 384 -148 
            LINE N 320 -160 384 -160 
            LINE N 320 -32 384 -32 
        END BLOCKDEF
        BEGIN BLOCK XLXI_1 adder_8_bit
            PIN a(7:0) a(7:0)
            PIN b(7:0) b(7:0)
            PIN c_in c_in
            PIN s(7:0) s(7:0)
            PIN c_out XLXN_9
        END BLOCK
        BEGIN BLOCK XLXI_2 adder_8_bit
            PIN a(7:0) a(15:8)
            PIN b(7:0) b(15:8)
            PIN c_in XLXN_9
            PIN s(7:0) s(15:8)
            PIN c_out XLXN_10
        END BLOCK
        BEGIN BLOCK XLXI_3 adder_8_bit
            PIN a(7:0) a(23:16)
            PIN b(7:0) b(23:16)
            PIN c_in XLXN_10
            PIN s(7:0) s(23:16)
            PIN c_out XLXN_11
        END BLOCK
        BEGIN BLOCK XLXI_4 adder_8_bit
            PIN a(7:0) a(31:24)
            PIN b(7:0) b(31:24)
            PIN c_in XLXN_11
            PIN s(7:0) s(31:24)
            PIN c_out c_out
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN INSTANCE XLXI_1 624 784 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_2 1280 784 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_3 1920 784 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_4 2608 784 R0
        END INSTANCE
        BEGIN BRANCH a(31:0)
            WIRE 432 240 720 240
        END BRANCH
        BEGIN BRANCH b(31:0)
            WIRE 432 304 720 304
        END BRANCH
        BEGIN BRANCH s(31:0)
            WIRE 864 256 1136 256
        END BRANCH
        IOMARKER 432 240 a(31:0) R180 28
        IOMARKER 432 304 b(31:0) R180 28
        IOMARKER 1136 256 s(31:0) R0 28
        BEGIN BRANCH a(7:0)
            WIRE 368 624 592 624
            WIRE 592 624 624 624
        END BRANCH
        BEGIN BRANCH c_in
            WIRE 592 752 624 752
        END BRANCH
        IOMARKER 592 752 c_in R180 28
        BEGIN BRANCH b(7:0)
            WIRE 368 688 624 688
        END BRANCH
        BEGIN BRANCH c_out
            WIRE 2992 752 3024 752
        END BRANCH
        IOMARKER 3024 752 c_out R0 28
        BEGIN BRANCH XLXN_9
            WIRE 1008 752 1280 752
        END BRANCH
        BEGIN BRANCH XLXN_10
            WIRE 1664 752 1920 752
        END BRANCH
        BEGIN BRANCH XLXN_11
            WIRE 2304 752 2608 752
        END BRANCH
        BEGIN BRANCH s(7:0)
            WIRE 1008 624 1072 624
            WIRE 1072 608 1072 624
        END BRANCH
        BEGIN BRANCH a(15:8)
            WIRE 1184 624 1280 624
        END BRANCH
        BEGIN BRANCH b(15:8)
            WIRE 1184 688 1280 688
        END BRANCH
        BEGIN BRANCH s(15:8)
            WIRE 1664 624 1760 624
        END BRANCH
        BEGIN BRANCH a(23:16)
            WIRE 1856 624 1920 624
        END BRANCH
        BEGIN BRANCH b(23:16)
            WIRE 1856 688 1920 688
        END BRANCH
        BEGIN BRANCH s(23:16)
            WIRE 2304 624 2416 624
        END BRANCH
        BEGIN BRANCH a(31:24)
            WIRE 2528 624 2608 624
        END BRANCH
        BEGIN BRANCH b(31:24)
            WIRE 2512 688 2608 688
        END BRANCH
        BEGIN BRANCH s(31:24)
            WIRE 2992 624 3120 624
        END BRANCH
    END SHEET
END SCHEMATIC
