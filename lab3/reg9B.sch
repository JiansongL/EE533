VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "aspartan2e"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL d(71:0)
        SIGNAL q(71:0)
        SIGNAL q(71:64)
        SIGNAL q(63:48)
        SIGNAL q(47:32)
        SIGNAL q(31:16)
        SIGNAL q(15:0)
        SIGNAL d(71:64)
        SIGNAL d(63:48)
        SIGNAL d(47:32)
        SIGNAL d(31:16)
        SIGNAL d(15:0)
        SIGNAL clk
        SIGNAL ce
        SIGNAL clr
        PORT Input d(71:0)
        PORT Output q(71:0)
        PORT Input clk
        PORT Input ce
        PORT Input clr
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
        BEGIN BLOCKDEF fd16ce
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -128 64 -128 
            LINE N 0 -192 64 -192 
            LINE N 0 -32 64 -32 
            LINE N 0 -256 64 -256 
            LINE N 384 -256 320 -256 
            LINE N 80 -128 64 -144 
            LINE N 64 -112 80 -128 
            RECTANGLE N 320 -268 384 -244 
            RECTANGLE N 0 -268 64 -244 
            LINE N 192 -32 64 -32 
            LINE N 192 -64 192 -32 
            RECTANGLE N 64 -320 320 -64 
        END BLOCKDEF
        BEGIN BLOCK XLXI_1 fd8ce
            PIN C clk
            PIN CE ce
            PIN CLR clr
            PIN D(7:0) d(71:64)
            PIN Q(7:0) q(71:64)
        END BLOCK
        BEGIN BLOCK XLXI_16 fd16ce
            PIN C clk
            PIN CE ce
            PIN CLR clr
            PIN D(15:0) d(15:0)
            PIN Q(15:0) q(15:0)
        END BLOCK
        BEGIN BLOCK XLXI_17 fd16ce
            PIN C clk
            PIN CE ce
            PIN CLR
            PIN D(15:0) d(63:48)
            PIN Q(15:0) q(63:48)
        END BLOCK
        BEGIN BLOCK XLXI_18 fd16ce
            PIN C clk
            PIN CE ce
            PIN CLR clr
            PIN D(15:0) d(47:32)
            PIN Q(15:0) q(47:32)
        END BLOCK
        BEGIN BLOCK XLXI_19 fd16ce
            PIN C clk
            PIN CE ce
            PIN CLR clr
            PIN D(15:0) d(31:16)
            PIN Q(15:0) q(31:16)
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN BRANCH d(71:0)
            WIRE 400 144 560 144
        END BRANCH
        IOMARKER 400 144 d(71:0) R180 28
        BEGIN BRANCH q(71:0)
            WIRE 816 160 976 160
        END BRANCH
        IOMARKER 976 160 q(71:0) R0 28
        INSTANCE XLXI_1 1328 656 R0
        BEGIN BRANCH q(71:64)
            WIRE 1712 400 1856 400
            BEGIN DISPLAY 1856 400 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH q(63:48)
            WIRE 1728 752 1856 752
            BEGIN DISPLAY 1856 752 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH q(47:32)
            WIRE 1712 1088 1856 1088
            BEGIN DISPLAY 1856 1088 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH q(31:16)
            WIRE 1712 1440 1872 1440
            BEGIN DISPLAY 1872 1440 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH q(15:0)
            WIRE 1712 1808 1904 1808
            BEGIN DISPLAY 1904 1808 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH d(71:64)
            WIRE 1200 400 1328 400
            BEGIN DISPLAY 1200 400 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH d(63:48)
            WIRE 1216 752 1344 752
            BEGIN DISPLAY 1216 752 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH d(47:32)
            WIRE 1216 1088 1328 1088
            BEGIN DISPLAY 1216 1088 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH d(31:16)
            WIRE 1264 1440 1328 1440
            BEGIN DISPLAY 1264 1440 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH d(15:0)
            WIRE 1248 1808 1328 1808
            BEGIN DISPLAY 1248 1808 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH clk
            WIRE 912 1936 944 1936
            WIRE 944 1936 1008 1936
            WIRE 1008 1936 1328 1936
            WIRE 1008 528 1328 528
            WIRE 1008 528 1008 880
            WIRE 1008 880 1344 880
            WIRE 1008 880 1008 1216
            WIRE 1008 1216 1328 1216
            WIRE 1008 1216 1008 1568
            WIRE 1008 1568 1008 1936
            WIRE 1008 1568 1328 1568
        END BRANCH
        BEGIN BRANCH ce
            WIRE 896 1872 960 1872
            WIRE 960 1872 1328 1872
            WIRE 960 464 960 816
            WIRE 960 816 1344 816
            WIRE 960 816 960 1152
            WIRE 960 1152 1328 1152
            WIRE 960 1152 960 1504
            WIRE 960 1504 960 1872
            WIRE 960 1504 1328 1504
            WIRE 960 464 1328 464
        END BRANCH
        INSTANCE XLXI_16 1328 2064 R0
        INSTANCE XLXI_17 1344 1008 R0
        INSTANCE XLXI_18 1328 1344 R0
        INSTANCE XLXI_19 1328 1696 R0
        IOMARKER 896 1872 ce R180 28
        IOMARKER 912 1936 clk R180 28
        BEGIN BRANCH clr
            WIRE 912 2032 1088 2032
            WIRE 1088 2032 1328 2032
            WIRE 1088 624 1328 624
            WIRE 1088 624 1088 1312
            WIRE 1088 1312 1328 1312
            WIRE 1088 1312 1088 1664
            WIRE 1088 1664 1088 2032
            WIRE 1088 1664 1328 1664
        END BRANCH
        IOMARKER 912 2032 clr R180 28
    END SHEET
END SCHEMATIC
