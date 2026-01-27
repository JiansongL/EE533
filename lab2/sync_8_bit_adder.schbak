VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "aspartan2e"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL a(7:0)
        SIGNAL b(7:0)
        SIGNAL c_in
        SIGNAL XLXN_4
        SIGNAL XLXN_5
        SIGNAL XLXN_6
        SIGNAL XLXN_7
        SIGNAL c_out
        SIGNAL XLXN_9(7:0)
        SIGNAL XLXN_11(7:0)
        SIGNAL reset
        SIGNAL XLXN_14
        SIGNAL XLXN_15(7:0)
        PORT Input a(7:0)
        PORT Input b(7:0)
        PORT Input c_in
        PORT Output c_out
        PORT Input reset
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
        BEGIN BLOCKDEF fd8re
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -128 64 -128 
            LINE N 0 -192 64 -192 
            LINE N 0 -256 64 -256 
            LINE N 384 -256 320 -256 
            LINE N 0 -32 64 -32 
            RECTANGLE N 0 -268 64 -244 
            RECTANGLE N 320 -268 384 -244 
            LINE N 80 -128 64 -144 
            LINE N 64 -112 80 -128 
            LINE N 192 -32 64 -32 
            LINE N 192 -64 192 -32 
            RECTANGLE N 64 -320 320 -64 
        END BLOCKDEF
        BEGIN BLOCKDEF fd
            TIMESTAMP 2000 1 1 10 10 10
            RECTANGLE N 64 -320 320 -64 
            LINE N 0 -128 64 -128 
            LINE N 0 -256 64 -256 
            LINE N 384 -256 320 -256 
            LINE N 80 -128 64 -144 
            LINE N 64 -112 80 -128 
        END BLOCKDEF
        BEGIN BLOCK XLXI_1 adder_8_bit
            PIN a(7:0) XLXN_9(7:0)
            PIN b(7:0) XLXN_15(7:0)
            PIN c_in XLXN_4
            PIN s(7:0) XLXN_11(7:0)
            PIN c_out
        END BLOCK
        BEGIN BLOCK XLXI_2 fd8re
            PIN C XLXN_7
            PIN CE XLXN_14
            PIN D(7:0) a(7:0)
            PIN R reset
            PIN Q(7:0) XLXN_9(7:0)
        END BLOCK
        BEGIN BLOCK XLXI_3 fd8re
            PIN C XLXN_7
            PIN CE XLXN_14
            PIN D(7:0) b(7:0)
            PIN R reset
            PIN Q(7:0) XLXN_15(7:0)
        END BLOCK
        BEGIN BLOCK XLXI_4 fd8re
            PIN C XLXN_7
            PIN CE XLXN_14
            PIN D(7:0) XLXN_11(7:0)
            PIN R reset
            PIN Q(7:0)
        END BLOCK
        BEGIN BLOCK XLXI_5 fd
            PIN C XLXN_7
            PIN D c_in
            PIN Q XLXN_4
        END BLOCK
        BEGIN BLOCK XLXI_6 fd
            PIN C XLXN_7
            PIN D
            PIN Q c_out
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN INSTANCE XLXI_1 1904 944 R0
        END INSTANCE
        INSTANCE XLXI_2 944 704 R0
        INSTANCE XLXI_3 944 1152 R0
        INSTANCE XLXI_4 944 1664 R0
        BEGIN BRANCH a(7:0)
            WIRE 768 448 944 448
        END BRANCH
        IOMARKER 768 448 a(7:0) R180 28
        BEGIN BRANCH b(7:0)
            WIRE 768 896 944 896
        END BRANCH
        IOMARKER 768 896 b(7:0) R180 28
        INSTANCE XLXI_5 1904 480 R0
        INSTANCE XLXI_6 1920 1440 R0
        BEGIN BRANCH c_in
            WIRE 1872 224 1904 224
        END BRANCH
        IOMARKER 1872 224 c_in R180 28
        BEGIN BRANCH XLXN_4
            WIRE 1840 688 1840 912
            WIRE 1840 912 1904 912
            WIRE 1840 688 2368 688
            WIRE 2288 224 2368 224
            WIRE 2368 224 2368 688
        END BRANCH
        BEGIN BRANCH XLXN_7
            WIRE 864 576 944 576
            WIRE 864 576 864 1024
            WIRE 864 1024 864 1536
            WIRE 864 1536 944 1536
            WIRE 864 1536 864 1712
            WIRE 864 1712 1808 1712
            WIRE 864 1024 944 1024
            WIRE 1792 352 1904 352
            WIRE 1792 352 1792 1312
            WIRE 1792 1312 1792 1696
            WIRE 1792 1696 1808 1696
            WIRE 1808 1696 1808 1712
            WIRE 1792 1312 1920 1312
        END BRANCH
        BEGIN BRANCH c_out
            WIRE 2304 1184 2336 1184
        END BRANCH
        IOMARKER 2336 1184 c_out R0 28
        BEGIN BRANCH XLXN_9(7:0)
            WIRE 1328 448 1616 448
            WIRE 1616 448 1616 784
            WIRE 1616 784 1904 784
        END BRANCH
        BEGIN BRANCH XLXN_11(7:0)
            WIRE 880 1408 944 1408
            WIRE 880 1408 880 1648
            WIRE 880 1648 2320 1648
            WIRE 2288 784 2320 784
            WIRE 2320 784 2320 1648
        END BRANCH
        BEGIN BRANCH reset
            WIRE 528 672 944 672
            WIRE 528 672 528 1104
            WIRE 528 1104 528 1120
            WIRE 528 1120 528 1632
            WIRE 528 1632 944 1632
            WIRE 528 1632 528 1728
            WIRE 528 1120 944 1120
        END BRANCH
        BEGIN BRANCH XLXN_14
            WIRE 832 512 944 512
            WIRE 832 512 832 960
            WIRE 832 960 832 1472
            WIRE 832 1472 944 1472
            WIRE 832 960 944 960
        END BRANCH
        IOMARKER 528 1728 reset R90 28
        BEGIN BRANCH XLXN_15(7:0)
            WIRE 1328 896 1616 896
            WIRE 1616 848 1616 896
            WIRE 1616 848 1904 848
        END BRANCH
    END SHEET
END SCHEMATIC
