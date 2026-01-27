VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "aspartan2e"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL XLXN_1
        SIGNAL a
        SIGNAL c_in
        SIGNAL XLXN_5
        SIGNAL XLXN_6
        SIGNAL XLXN_7
        SIGNAL s
        SIGNAL c_out
        SIGNAL b
        PORT Input a
        PORT Input c_in
        PORT Output s
        PORT Output c_out
        PORT Input b
        BEGIN BLOCKDEF xor2
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -64 64 -64 
            LINE N 0 -128 60 -128 
            LINE N 256 -96 208 -96 
            ARC N -40 -152 72 -40 48 -48 44 -144 
            ARC N -24 -152 88 -40 64 -48 64 -144 
            LINE N 128 -144 64 -144 
            LINE N 128 -48 64 -48 
            ARC N 44 -144 220 32 208 -96 128 -144 
            ARC N 44 -224 220 -48 128 -48 208 -96 
        END BLOCKDEF
        BEGIN BLOCKDEF or3
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -64 48 -64 
            LINE N 0 -128 72 -128 
            LINE N 0 -192 48 -192 
            LINE N 256 -128 192 -128 
            ARC N 28 -256 204 -80 112 -80 192 -128 
            ARC N -40 -184 72 -72 48 -80 48 -176 
            LINE N 48 -64 48 -80 
            LINE N 48 -192 48 -176 
            LINE N 112 -80 48 -80 
            ARC N 28 -176 204 0 192 -128 112 -176 
            LINE N 112 -176 48 -176 
        END BLOCKDEF
        BEGIN BLOCKDEF and2
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -64 64 -64 
            LINE N 0 -128 64 -128 
            LINE N 256 -96 192 -96 
            ARC N 96 -144 192 -48 144 -48 144 -144 
            LINE N 144 -48 64 -48 
            LINE N 64 -144 144 -144 
            LINE N 64 -48 64 -144 
        END BLOCKDEF
        BEGIN BLOCK XLXI_1 xor2
            PIN I0 b
            PIN I1 a
            PIN O XLXN_1
        END BLOCK
        BEGIN BLOCK XLXI_2 xor2
            PIN I0 c_in
            PIN I1 XLXN_1
            PIN O s
        END BLOCK
        BEGIN BLOCK XLXI_3 or3
            PIN I0 XLXN_7
            PIN I1 XLXN_6
            PIN I2 XLXN_5
            PIN O c_out
        END BLOCK
        BEGIN BLOCK XLXI_4 and2
            PIN I0 b
            PIN I1 a
            PIN O XLXN_5
        END BLOCK
        BEGIN BLOCK XLXI_6 and2
            PIN I0 b
            PIN I1 c_in
            PIN O XLXN_7
        END BLOCK
        BEGIN BLOCK XLXI_7 and2
            PIN I0 c_in
            PIN I1 a
            PIN O XLXN_6
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        INSTANCE XLXI_1 1008 448 R0
        INSTANCE XLXI_2 1456 480 R0
        BEGIN BRANCH XLXN_1
            WIRE 1264 352 1456 352
        END BRANCH
        BEGIN BRANCH a
            WIRE 656 320 704 320
            WIRE 704 320 1008 320
            WIRE 704 320 704 576
            WIRE 704 576 704 736
            WIRE 704 736 912 736
            WIRE 704 576 928 576
        END BRANCH
        IOMARKER 656 320 a R180 28
        IOMARKER 656 384 b R180 28
        IOMARKER 656 448 c_in R180 28
        INSTANCE XLXI_4 928 704 R0
        INSTANCE XLXI_6 928 1040 R0
        INSTANCE XLXI_3 1504 896 R0
        BEGIN BRANCH XLXN_5
            WIRE 1184 608 1504 608
            WIRE 1504 608 1504 704
        END BRANCH
        BEGIN BRANCH XLXN_6
            WIRE 1168 768 1504 768
        END BRANCH
        BEGIN BRANCH XLXN_7
            WIRE 1184 944 1504 944
            WIRE 1504 832 1504 944
        END BRANCH
        BEGIN BRANCH s
            WIRE 1712 384 1744 384
        END BRANCH
        IOMARKER 1744 384 s R0 28
        BEGIN BRANCH c_out
            WIRE 1760 768 1824 768
        END BRANCH
        IOMARKER 1824 768 c_out R0 28
        BEGIN BRANCH b
            WIRE 656 384 752 384
            WIRE 752 384 1008 384
            WIRE 752 384 752 640
            WIRE 752 640 752 832
            WIRE 752 832 752 976
            WIRE 752 976 928 976
            WIRE 752 640 928 640
        END BRANCH
        INSTANCE XLXI_7 912 864 R0
        BEGIN BRANCH c_in
            WIRE 656 448 816 448
            WIRE 816 448 832 448
            WIRE 832 448 1440 448
            WIRE 832 448 832 800
            WIRE 832 800 832 912
            WIRE 832 912 928 912
            WIRE 832 800 912 800
            WIRE 1440 416 1456 416
            WIRE 1440 416 1440 448
        END BRANCH
    END SHEET
END SCHEMATIC
