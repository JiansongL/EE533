VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "aspartan2e"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL datain(111:0)
        SIGNAL match
        SIGNAL XLXN_3
        SIGNAL XLXN_4
        SIGNAL XLXN_5
        SIGNAL XLXN_6
        SIGNAL XLXN_7
        SIGNAL XLXN_8
        SIGNAL XLXN_9
        SIGNAL XLXN_11
        SIGNAL wildcard(6:0)
        SIGNAL datacomp(55:0)
        SIGNAL datain(111:56)
        SIGNAL datain(103:48)
        SIGNAL datain(95:40)
        SIGNAL datain(87:32)
        SIGNAL datain(79:24)
        SIGNAL datain(71:16)
        SIGNAL datain(55:0)
        SIGNAL datain(63:8)
        PORT Input datain(111:0)
        PORT Output match
        PORT Input wildcard(6:0)
        PORT Input datacomp(55:0)
        BEGIN BLOCKDEF comparator
            TIMESTAMP 2026 1 31 6 7 26
            RECTANGLE N 64 -192 320 0 
            RECTANGLE N 0 -172 64 -148 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -44 64 -20 
            LINE N 64 -32 0 -32 
            LINE N 320 -160 384 -160 
        END BLOCKDEF
        BEGIN BLOCKDEF or8
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -64 48 -64 
            LINE N 0 -128 48 -128 
            LINE N 0 -192 48 -192 
            LINE N 0 -384 48 -384 
            LINE N 0 -448 48 -448 
            LINE N 0 -512 48 -512 
            LINE N 256 -288 192 -288 
            LINE N 0 -320 64 -320 
            LINE N 0 -256 64 -256 
            ARC N 28 -336 204 -160 192 -288 112 -336 
            LINE N 112 -240 48 -240 
            ARC N 28 -416 204 -240 112 -240 192 -288 
            ARC N -40 -344 72 -232 48 -240 48 -336 
            LINE N 112 -336 48 -336 
            LINE N 48 -336 48 -512 
            LINE N 48 -64 48 -240 
        END BLOCKDEF
        BEGIN BLOCK XLXI_1 comparator
            PIN a(55:0) datacomp(55:0)
            PIN b(55:0) datain(55:0)
            PIN amask(6:0) wildcard(6:0)
            PIN match XLXN_3
        END BLOCK
        BEGIN BLOCK XLXI_2 comparator
            PIN a(55:0) datacomp(55:0)
            PIN b(55:0) datain(63:8)
            PIN amask(6:0) wildcard(6:0)
            PIN match XLXN_4
        END BLOCK
        BEGIN BLOCK XLXI_3 comparator
            PIN a(55:0) datacomp(55:0)
            PIN b(55:0) datain(71:16)
            PIN amask(6:0) wildcard(6:0)
            PIN match XLXN_5
        END BLOCK
        BEGIN BLOCK XLXI_4 comparator
            PIN a(55:0) datacomp(55:0)
            PIN b(55:0) datain(79:24)
            PIN amask(6:0) wildcard(6:0)
            PIN match XLXN_6
        END BLOCK
        BEGIN BLOCK XLXI_5 comparator
            PIN a(55:0) datacomp(55:0)
            PIN b(55:0) datain(95:40)
            PIN amask(6:0) wildcard(6:0)
            PIN match XLXN_8
        END BLOCK
        BEGIN BLOCK XLXI_6 comparator
            PIN a(55:0) datacomp(55:0)
            PIN b(55:0) datain(103:48)
            PIN amask(6:0) wildcard(6:0)
            PIN match XLXN_9
        END BLOCK
        BEGIN BLOCK XLXI_7 comparator
            PIN a(55:0) datacomp(55:0)
            PIN b(55:0) datain(111:56)
            PIN amask(6:0) wildcard(6:0)
            PIN match XLXN_11
        END BLOCK
        BEGIN BLOCK XLXI_10 or8
            PIN I0 XLXN_11
            PIN I1 XLXN_9
            PIN I2 XLXN_8
            PIN I3 XLXN_7
            PIN I4 XLXN_6
            PIN I5 XLXN_5
            PIN I6 XLXN_4
            PIN I7 XLXN_3
            PIN O match
        END BLOCK
        BEGIN BLOCK XLXI_11 comparator
            PIN a(55:0) datacomp(55:0)
            PIN b(55:0) datain(87:32)
            PIN amask(6:0) wildcard(6:0)
            PIN match XLXN_7
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN BRANCH datain(111:0)
            WIRE 928 416 1040 416
        END BRANCH
        BEGIN INSTANCE XLXI_1 1296 704 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_2 1296 960 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_3 1296 1216 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_4 1296 1472 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_5 1296 2000 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_6 1296 2256 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_7 1296 2512 R0
        END INSTANCE
        INSTANCE XLXI_10 2448 1664 R0
        BEGIN BRANCH match
            WIRE 2704 1376 2736 1376
        END BRANCH
        BEGIN BRANCH XLXN_3
            WIRE 1680 544 2448 544
            WIRE 2448 544 2448 1152
        END BRANCH
        BEGIN BRANCH XLXN_4
            WIRE 1680 800 2064 800
            WIRE 2064 800 2064 1216
            WIRE 2064 1216 2448 1216
        END BRANCH
        BEGIN BRANCH XLXN_5
            WIRE 1680 1056 2048 1056
            WIRE 2048 1056 2048 1280
            WIRE 2048 1280 2448 1280
        END BRANCH
        BEGIN BRANCH XLXN_6
            WIRE 1680 1312 2064 1312
            WIRE 2064 1312 2064 1344
            WIRE 2064 1344 2448 1344
        END BRANCH
        BEGIN BRANCH XLXN_7
            WIRE 1680 1584 2064 1584
            WIRE 2064 1408 2064 1584
            WIRE 2064 1408 2448 1408
        END BRANCH
        BEGIN BRANCH XLXN_8
            WIRE 1680 1840 2080 1840
            WIRE 2080 1472 2080 1840
            WIRE 2080 1472 2448 1472
        END BRANCH
        BEGIN BRANCH XLXN_9
            WIRE 1680 2096 2096 2096
            WIRE 2096 1536 2096 2096
            WIRE 2096 1536 2448 1536
        END BRANCH
        BEGIN BRANCH XLXN_11
            WIRE 1680 2352 2448 2352
            WIRE 2448 1600 2448 2352
        END BRANCH
        BEGIN BRANCH wildcard(6:0)
            WIRE 1008 672 1104 672
            WIRE 1104 672 1296 672
            WIRE 1104 672 1104 928
            WIRE 1104 928 1296 928
            WIRE 1104 928 1104 1184
            WIRE 1104 1184 1296 1184
            WIRE 1104 1184 1104 1440
            WIRE 1104 1440 1296 1440
            WIRE 1104 1440 1104 1712
            WIRE 1104 1712 1296 1712
            WIRE 1104 1712 1104 1968
            WIRE 1104 1968 1296 1968
            WIRE 1104 1968 1104 2224
            WIRE 1104 2224 1104 2480
            WIRE 1104 2480 1296 2480
            WIRE 1104 2224 1296 2224
        END BRANCH
        BEGIN BRANCH datacomp(55:0)
            WIRE 992 544 1040 544
            WIRE 1040 544 1296 544
            WIRE 1040 544 1040 800
            WIRE 1040 800 1296 800
            WIRE 1040 800 1040 1056
            WIRE 1040 1056 1296 1056
            WIRE 1040 1056 1040 1312
            WIRE 1040 1312 1296 1312
            WIRE 1040 1312 1040 1584
            WIRE 1040 1584 1040 1840
            WIRE 1040 1840 1296 1840
            WIRE 1040 1840 1040 2096
            WIRE 1040 2096 1040 2352
            WIRE 1040 2352 1296 2352
            WIRE 1040 2096 1296 2096
            WIRE 1040 1584 1296 1584
        END BRANCH
        BEGIN INSTANCE XLXI_11 1296 1744 R0
        END INSTANCE
        BEGIN BRANCH datain(111:56)
            WIRE 1216 2416 1296 2416
            BEGIN DISPLAY 1216 2416 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH datain(103:48)
            WIRE 1200 2160 1296 2160
            BEGIN DISPLAY 1200 2160 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH datain(95:40)
            WIRE 1184 1904 1296 1904
            BEGIN DISPLAY 1184 1904 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH datain(87:32)
            WIRE 1184 1648 1296 1648
            BEGIN DISPLAY 1184 1648 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH datain(79:24)
            WIRE 1200 1376 1296 1376
            BEGIN DISPLAY 1200 1376 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH datain(71:16)
            WIRE 1200 1120 1296 1120
            BEGIN DISPLAY 1200 1120 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH datain(55:0)
            WIRE 1184 608 1296 608
            BEGIN DISPLAY 1184 608 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH datain(63:8)
            WIRE 1184 864 1296 864
            BEGIN DISPLAY 1184 864 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        IOMARKER 928 416 datain(111:0) R180 28
        IOMARKER 2736 1376 match R0 28
        IOMARKER 992 544 datacomp(55:0) R180 28
        IOMARKER 1008 672 wildcard(6:0) R180 28
    END SHEET
END SCHEMATIC
