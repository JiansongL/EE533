VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "aspartan2e"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL XLXN_1
        SIGNAL XLXN_2
        SIGNAL XLXN_3
        SIGNAL XLXN_4
        SIGNAL match
        SIGNAL a(55:48)
        SIGNAL b(55:48)
        SIGNAL b(47:40)
        SIGNAL a(39:32)
        SIGNAL b(39:32)
        SIGNAL a(31:24)
        SIGNAL b(31:24)
        SIGNAL a(55:0)
        SIGNAL b(55:0)
        SIGNAL amask(6:0)
        SIGNAL amask(6)
        SIGNAL a(47:40)
        SIGNAL amask(4)
        SIGNAL amask(3)
        SIGNAL amask(5)
        SIGNAL XLXN_23
        SIGNAL XLXN_24
        SIGNAL XLXN_25
        SIGNAL XLXN_26
        SIGNAL XLXN_27
        SIGNAL XLXN_28
        SIGNAL XLXN_29
        SIGNAL XLXN_30
        SIGNAL XLXN_31
        SIGNAL XLXN_32
        SIGNAL amask(2)
        SIGNAL a(23:16)
        SIGNAL b(23:16)
        SIGNAL a(15:8)
        SIGNAL b(15:8)
        SIGNAL a(7:0)
        SIGNAL b(7:0)
        SIGNAL amask(1)
        SIGNAL amask(0)
        PORT Output match
        PORT Input a(55:0)
        PORT Input b(55:0)
        PORT Input amask(6:0)
        BEGIN BLOCKDEF comp8
            TIMESTAMP 2000 1 1 10 10 10
            RECTANGLE N 64 -384 320 -64 
            LINE N 384 -224 320 -224 
            RECTANGLE N 0 -332 64 -308 
            LINE N 0 -320 64 -320 
            RECTANGLE N 0 -140 64 -116 
            LINE N 0 -128 64 -128 
        END BLOCKDEF
        BEGIN BLOCKDEF or2b1
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -64 32 -64 
            CIRCLE N 32 -76 56 -52 
            LINE N 0 -128 64 -128 
            LINE N 256 -96 192 -96 
            LINE N 112 -48 48 -48 
            ARC N 28 -144 204 32 192 -96 112 -144 
            LINE N 112 -144 48 -144 
            ARC N -40 -152 72 -40 48 -48 48 -144 
            ARC N 28 -224 204 -48 112 -48 192 -96 
        END BLOCKDEF
        BEGIN BLOCKDEF and7
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 64 -448 64 -64 
            ARC N 96 -304 192 -208 144 -208 144 -304 
            LINE N 64 -304 144 -304 
            LINE N 144 -208 64 -208 
            LINE N 256 -256 192 -256 
            LINE N 0 -448 64 -448 
            LINE N 0 -384 64 -384 
            LINE N 0 -320 64 -320 
            LINE N 0 -256 64 -256 
            LINE N 0 -192 64 -192 
            LINE N 0 -128 64 -128 
            LINE N 0 -64 64 -64 
        END BLOCKDEF
        BEGIN BLOCK XLXI_1 comp8
            PIN A(7:0) a(55:48)
            PIN B(7:0) b(55:48)
            PIN EQ XLXN_1
        END BLOCK
        BEGIN BLOCK XLXI_2 comp8
            PIN A(7:0) a(47:40)
            PIN B(7:0) b(47:40)
            PIN EQ XLXN_2
        END BLOCK
        BEGIN BLOCK XLXI_3 comp8
            PIN A(7:0) a(39:32)
            PIN B(7:0) b(39:32)
            PIN EQ XLXN_3
        END BLOCK
        BEGIN BLOCK XLXI_4 comp8
            PIN A(7:0) a(31:24)
            PIN B(7:0) b(31:24)
            PIN EQ XLXN_4
        END BLOCK
        BEGIN BLOCK XLXI_5 or2b1
            PIN I0 amask(6)
            PIN I1 XLXN_1
            PIN O XLXN_26
        END BLOCK
        BEGIN BLOCK XLXI_6 or2b1
            PIN I0 amask(5)
            PIN I1 XLXN_2
            PIN O XLXN_27
        END BLOCK
        BEGIN BLOCK XLXI_7 or2b1
            PIN I0 amask(4)
            PIN I1 XLXN_3
            PIN O XLXN_28
        END BLOCK
        BEGIN BLOCK XLXI_8 or2b1
            PIN I0 amask(3)
            PIN I1 XLXN_4
            PIN O XLXN_29
        END BLOCK
        BEGIN BLOCK XLXI_9 and7
            PIN I0 XLXN_32
            PIN I1 XLXN_31
            PIN I2 XLXN_30
            PIN I3 XLXN_29
            PIN I4 XLXN_28
            PIN I5 XLXN_27
            PIN I6 XLXN_26
            PIN O match
        END BLOCK
        BEGIN BLOCK XLXI_10 comp8
            PIN A(7:0) a(23:16)
            PIN B(7:0) b(23:16)
            PIN EQ XLXN_23
        END BLOCK
        BEGIN BLOCK XLXI_11 comp8
            PIN A(7:0) a(15:8)
            PIN B(7:0) b(15:8)
            PIN EQ XLXN_24
        END BLOCK
        BEGIN BLOCK XLXI_12 comp8
            PIN A(7:0) a(7:0)
            PIN B(7:0) b(7:0)
            PIN EQ XLXN_25
        END BLOCK
        BEGIN BLOCK XLXI_13 or2b1
            PIN I0 amask(2)
            PIN I1 XLXN_23
            PIN O XLXN_30
        END BLOCK
        BEGIN BLOCK XLXI_14 or2b1
            PIN I0 amask(1)
            PIN I1 XLXN_24
            PIN O XLXN_31
        END BLOCK
        BEGIN BLOCK XLXI_15 or2b1
            PIN I0 amask(0)
            PIN I1 XLXN_25
            PIN O XLXN_32
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        INSTANCE XLXI_1 544 800 R0
        INSTANCE XLXI_2 560 1216 R0
        INSTANCE XLXI_3 560 1616 R0
        INSTANCE XLXI_4 560 2000 R0
        BEGIN BRANCH XLXN_1
            WIRE 928 576 960 576
        END BRANCH
        INSTANCE XLXI_5 960 704 R0
        BEGIN BRANCH XLXN_2
            WIRE 944 992 976 992
        END BRANCH
        INSTANCE XLXI_6 976 1120 R0
        BEGIN BRANCH XLXN_3
            WIRE 944 1392 976 1392
        END BRANCH
        INSTANCE XLXI_7 976 1520 R0
        BEGIN BRANCH XLXN_4
            WIRE 944 1776 976 1776
        END BRANCH
        INSTANCE XLXI_8 976 1904 R0
        BEGIN BRANCH match
            WIRE 3296 1104 3360 1104
        END BRANCH
        IOMARKER 3360 1104 match R0 28
        INSTANCE XLXI_9 3040 1360 R0
        BEGIN BRANCH a(55:48)
            WIRE 432 480 544 480
            BEGIN DISPLAY 432 480 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH b(55:48)
            WIRE 448 672 544 672
            BEGIN DISPLAY 448 672 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH a(47:40)
            WIRE 432 896 560 896
            BEGIN DISPLAY 432 896 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH b(47:40)
            WIRE 432 1088 560 1088
            BEGIN DISPLAY 432 1088 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH a(39:32)
            WIRE 448 1296 560 1296
            BEGIN DISPLAY 448 1296 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH b(39:32)
            WIRE 448 1488 560 1488
            BEGIN DISPLAY 448 1488 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH a(31:24)
            WIRE 448 1680 560 1680
            BEGIN DISPLAY 448 1680 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH b(31:24)
            WIRE 448 1872 560 1872
            BEGIN DISPLAY 448 1872 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH a(55:0)
            WIRE 464 240 592 240
        END BRANCH
        BEGIN BRANCH b(55:0)
            WIRE 464 288 592 288
        END BRANCH
        IOMARKER 464 240 a(55:0) R180 28
        IOMARKER 464 288 b(55:0) R180 28
        IOMARKER 864 256 amask(6:0) R180 28
        BEGIN BRANCH amask(6:0)
            WIRE 864 256 1056 256
        END BRANCH
        BEGIN BRANCH amask(6)
            WIRE 928 640 960 640
            BEGIN DISPLAY 928 640 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH amask(5)
            WIRE 944 1056 976 1056
            BEGIN DISPLAY 944 1056 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH amask(4)
            WIRE 944 1456 976 1456
            BEGIN DISPLAY 944 1456 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH amask(3)
            WIRE 944 1840 976 1840
            BEGIN DISPLAY 944 1840 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_10 1968 880 R0
        INSTANCE XLXI_11 1984 1312 R0
        INSTANCE XLXI_12 1984 1760 R0
        BEGIN BRANCH XLXN_23
            WIRE 2352 656 2384 656
        END BRANCH
        INSTANCE XLXI_13 2384 784 R0
        BEGIN BRANCH XLXN_24
            WIRE 2368 1088 2400 1088
        END BRANCH
        INSTANCE XLXI_14 2400 1216 R0
        BEGIN BRANCH XLXN_25
            WIRE 2368 1536 2400 1536
        END BRANCH
        INSTANCE XLXI_15 2400 1664 R0
        BEGIN BRANCH XLXN_26
            WIRE 1216 608 1296 608
            WIRE 1296 608 1296 912
            WIRE 1296 912 3040 912
        END BRANCH
        BEGIN BRANCH XLXN_27
            WIRE 1232 1024 1280 1024
            WIRE 1280 1024 1280 1312
            WIRE 1280 1312 2384 1312
            WIRE 2384 976 2384 1312
            WIRE 2384 976 3040 976
        END BRANCH
        BEGIN BRANCH XLXN_28
            WIRE 1232 1424 1296 1424
            WIRE 1296 1328 1296 1424
            WIRE 1296 1328 2720 1328
            WIRE 2720 1040 2720 1328
            WIRE 2720 1040 3040 1040
        END BRANCH
        BEGIN BRANCH XLXN_29
            WIRE 1232 1808 2704 1808
            WIRE 2704 1104 2704 1808
            WIRE 2704 1104 3040 1104
        END BRANCH
        BEGIN BRANCH XLXN_30
            WIRE 2640 688 2832 688
            WIRE 2832 688 2832 1168
            WIRE 2832 1168 3040 1168
        END BRANCH
        BEGIN BRANCH XLXN_31
            WIRE 2656 1120 2816 1120
            WIRE 2816 1120 2816 1232
            WIRE 2816 1232 3040 1232
        END BRANCH
        BEGIN BRANCH XLXN_32
            WIRE 2656 1568 3040 1568
            WIRE 3040 1296 3040 1568
        END BRANCH
        BEGIN BRANCH amask(2)
            WIRE 2352 720 2384 720
            BEGIN DISPLAY 2352 720 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH a(23:16)
            WIRE 1904 560 1968 560
            BEGIN DISPLAY 1904 560 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH b(23:16)
            WIRE 1904 752 1968 752
            BEGIN DISPLAY 1904 752 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH a(15:8)
            WIRE 1904 992 1984 992
            BEGIN DISPLAY 1904 992 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH b(15:8)
            WIRE 1920 1184 1984 1184
            BEGIN DISPLAY 1920 1184 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH a(7:0)
            WIRE 1920 1440 1984 1440
            BEGIN DISPLAY 1920 1440 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH b(7:0)
            WIRE 1920 1632 1984 1632
            BEGIN DISPLAY 1920 1632 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH amask(1)
            WIRE 2368 1152 2400 1152
            BEGIN DISPLAY 2368 1152 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH amask(0)
            WIRE 2384 1600 2400 1600
            WIRE 2384 1600 2384 1680
            BEGIN DISPLAY 2384 1680 ATTR Name
                ALIGNMENT SOFT-VRIGHT
            END DISPLAY
        END BRANCH
    END SHEET
END SCHEMATIC
