VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "aspartan2e"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL XLXN_22(55:0)
        SIGNAL hwregA(63:0)
        SIGNAL pipe(71:0)
        SIGNAL pipe0(71:0)
        SIGNAL ce
        SIGNAL pipe0(47:0)
        SIGNAL pipe0(63:0)
        SIGNAL XLXN_43(111:0)
        SIGNAL match
        SIGNAL XLXN_45
        SIGNAL XLXN_46
        SIGNAL XLXN_47
        SIGNAL clk
        SIGNAL XLXN_49
        SIGNAL mrst
        SIGNAL XLXN_52
        SIGNAL XLXN_53
        SIGNAL XLXN_54
        SIGNAL match_en
        SIGNAL hwregA(61:56)
        SIGNAL hwregA(55:0)
        PORT Input hwregA(63:0)
        PORT Input pipe(71:0)
        PORT Input ce
        PORT Output match
        PORT Input clk
        PORT Input mrst
        PORT Input match_en
        BEGIN BLOCKDEF reg9B
            TIMESTAMP 2026 1 31 6 53 56
            LINE N 64 160 0 160 
            LINE N 64 32 0 32 
            RECTANGLE N 0 -172 64 -148 
            LINE N 64 -160 0 -160 
            LINE N 64 -32 0 -32 
            RECTANGLE N 320 -172 384 -148 
            LINE N 320 -160 384 -160 
            RECTANGLE N 64 -192 320 192 
        END BLOCKDEF
        BEGIN BLOCKDEF busmerge
            TIMESTAMP 2026 1 31 6 41 55
            RECTANGLE N 64 -128 320 0 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -44 64 -20 
            LINE N 64 -32 0 -32 
            RECTANGLE N 320 -108 384 -84 
            LINE N 320 -96 384 -96 
        END BLOCKDEF
        BEGIN BLOCKDEF wordmatch
            TIMESTAMP 2026 1 31 6 35 28
            RECTANGLE N 64 -192 320 0 
            RECTANGLE N 0 -172 64 -148 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -44 64 -20 
            LINE N 64 -32 0 -32 
            LINE N 320 -160 384 -160 
        END BLOCKDEF
        BEGIN BLOCKDEF fdce
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -128 64 -128 
            LINE N 0 -192 64 -192 
            LINE N 0 -32 64 -32 
            LINE N 0 -256 64 -256 
            LINE N 384 -256 320 -256 
            LINE N 64 -112 80 -128 
            LINE N 80 -128 64 -144 
            LINE N 192 -64 192 -32 
            LINE N 192 -32 64 -32 
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
        BEGIN BLOCKDEF and3b1
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -64 40 -64 
            CIRCLE N 40 -76 64 -52 
            LINE N 0 -128 64 -128 
            LINE N 0 -192 64 -192 
            LINE N 256 -128 192 -128 
            LINE N 64 -64 64 -192 
            ARC N 96 -176 192 -80 144 -80 144 -176 
            LINE N 144 -80 64 -80 
            LINE N 64 -176 144 -176 
        END BLOCKDEF
        BEGIN BLOCK XLXI_13 busmerge
            PIN da(47:0) pipe0(47:0)
            PIN db(63:0) pipe0(63:0)
            PIN q(111:0) XLXN_43(111:0)
        END BLOCK
        BEGIN BLOCK XLXI_14 wordmatch
            PIN datain(111:0) XLXN_43(111:0)
            PIN wildcard(6:0) hwregA(61:56)
            PIN datacomp(55:0) hwregA(55:0)
            PIN match XLXN_52
        END BLOCK
        BEGIN BLOCK XLXI_15 fdce
            PIN C clk
            PIN CE XLXN_54
            PIN CLR XLXN_49
            PIN D XLXN_54
            PIN Q match
        END BLOCK
        BEGIN BLOCK XLXI_16 fd
            PIN C clk
            PIN D mrst
            PIN Q XLXN_49
        END BLOCK
        BEGIN BLOCK XLXI_17 reg9B
            PIN d(71:0) pipe(71:0)
            PIN clk clk
            PIN ce ce
            PIN clr XLXN_49
            PIN q(71:0) pipe0(71:0)
        END BLOCK
        BEGIN BLOCK XLXI_18 and3b1
            PIN I0 match
            PIN I1 match_en
            PIN I2 XLXN_52
            PIN O XLXN_54
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN BRANCH hwregA(63:0)
            WIRE 256 144 544 144
        END BRANCH
        IOMARKER 256 144 hwregA(63:0) R180 28
        BEGIN INSTANCE XLXI_13 592 1024 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_14 1168 1088 R0
        END INSTANCE
        BEGIN BRANCH pipe(71:0)
            WIRE 432 352 560 352
        END BRANCH
        BEGIN BRANCH pipe0(71:0)
            WIRE 944 352 1040 352
            BEGIN DISPLAY 1040 352 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ce
            WIRE 432 480 560 480
        END BRANCH
        IOMARKER 432 352 pipe(71:0) R180 28
        IOMARKER 432 480 ce R180 28
        BEGIN BRANCH pipe0(47:0)
            WIRE 432 928 592 928
            BEGIN DISPLAY 432 928 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH pipe0(63:0)
            WIRE 432 992 592 992
            BEGIN DISPLAY 432 992 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_43(111:0)
            WIRE 976 928 1168 928
        END BRANCH
        INSTANCE XLXI_15 1792 736 R0
        BEGIN BRANCH match
            WIRE 1568 1056 1648 1056
            WIRE 1568 1056 1568 1152
            WIRE 1568 1152 2208 1152
            WIRE 2176 480 2208 480
            WIRE 2208 480 2352 480
            WIRE 2208 480 2208 1152
        END BRANCH
        IOMARKER 2352 480 match R0 28
        INSTANCE XLXI_16 1072 832 R0
        BEGIN INSTANCE XLXI_17 560 512 R0
        END INSTANCE
        BEGIN BRANCH clk
            WIRE 400 672 464 672
            WIRE 464 672 560 672
            WIRE 464 672 464 784
            WIRE 464 784 1008 784
            WIRE 1008 704 1008 784
            WIRE 1008 704 1024 704
            WIRE 1024 704 1072 704
            WIRE 1024 704 1024 832
            WIRE 1024 832 1520 832
            WIRE 1520 608 1520 832
            WIRE 1520 608 1792 608
        END BRANCH
        BEGIN BRANCH XLXN_49
            WIRE 496 272 496 544
            WIRE 496 544 560 544
            WIRE 496 272 1616 272
            WIRE 1616 272 1616 576
            WIRE 1616 576 1616 704
            WIRE 1616 704 1792 704
            WIRE 1456 576 1616 576
        END BRANCH
        IOMARKER 400 672 clk R180 28
        BEGIN BRANCH mrst
            WIRE 1040 576 1072 576
        END BRANCH
        IOMARKER 1040 576 mrst R180 28
        INSTANCE XLXI_18 1648 1120 R0
        BEGIN BRANCH XLXN_52
            WIRE 1552 928 1648 928
        END BRANCH
        BEGIN BRANCH XLXN_54
            WIRE 1712 480 1792 480
            WIRE 1712 480 1712 544
            WIRE 1712 544 1712 784
            WIRE 1712 784 1968 784
            WIRE 1968 784 1968 992
            WIRE 1712 544 1792 544
            WIRE 1904 992 1968 992
        END BRANCH
        BEGIN BRANCH match_en
            WIRE 1616 992 1648 992
        END BRANCH
        IOMARKER 1616 992 match_en R180 28
        BEGIN BRANCH hwregA(61:56)
            WIRE 1040 992 1168 992
            BEGIN DISPLAY 1040 992 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH hwregA(55:0)
            WIRE 1040 1056 1168 1056
            BEGIN DISPLAY 1040 1056 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
    END SHEET
END SCHEMATIC
