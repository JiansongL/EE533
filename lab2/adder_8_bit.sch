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
        SIGNAL s(7:0)
        SIGNAL XLXN_4
        SIGNAL XLXN_5
        SIGNAL XLXN_6
        SIGNAL XLXN_7
        SIGNAL XLXN_8
        SIGNAL XLXN_9
        SIGNAL XLXN_10
        SIGNAL c_out
        SIGNAL c_in
        SIGNAL a(0)
        SIGNAL s(0)
        SIGNAL a(1)
        SIGNAL b(0)
        SIGNAL b(1)
        SIGNAL s(1)
        SIGNAL a(2)
        SIGNAL b(2)
        SIGNAL s(2)
        SIGNAL a(3)
        SIGNAL b(3)
        SIGNAL s(3)
        SIGNAL a(4)
        SIGNAL b(4)
        SIGNAL s(4)
        SIGNAL s(5)
        SIGNAL a(5)
        SIGNAL b(5)
        SIGNAL a(6)
        SIGNAL b(6)
        SIGNAL a(7)
        SIGNAL b(7)
        SIGNAL s(6)
        SIGNAL s(7)
        PORT Input a(7:0)
        PORT Input b(7:0)
        PORT Output s(7:0)
        PORT Output c_out
        PORT Input c_in
        BEGIN BLOCKDEF full_adder
            TIMESTAMP 2026 1 27 5 50 10
            RECTANGLE N 64 -192 320 0 
            LINE N 64 -160 0 -160 
            LINE N 64 -96 0 -96 
            LINE N 64 -32 0 -32 
            LINE N 320 -160 384 -160 
            LINE N 320 -32 384 -32 
        END BLOCKDEF
        BEGIN BLOCK XLXI_1 full_adder
            PIN a a(0)
            PIN c_in c_in
            PIN b b(0)
            PIN s s(0)
            PIN c_out XLXN_4
        END BLOCK
        BEGIN BLOCK XLXI_2 full_adder
            PIN a a(1)
            PIN c_in XLXN_4
            PIN b b(1)
            PIN s s(1)
            PIN c_out XLXN_5
        END BLOCK
        BEGIN BLOCK XLXI_3 full_adder
            PIN a a(2)
            PIN c_in XLXN_5
            PIN b b(2)
            PIN s s(2)
            PIN c_out XLXN_6
        END BLOCK
        BEGIN BLOCK XLXI_4 full_adder
            PIN a a(3)
            PIN c_in XLXN_6
            PIN b b(3)
            PIN s s(3)
            PIN c_out XLXN_7
        END BLOCK
        BEGIN BLOCK XLXI_5 full_adder
            PIN a a(4)
            PIN c_in XLXN_7
            PIN b b(4)
            PIN s s(4)
            PIN c_out XLXN_8
        END BLOCK
        BEGIN BLOCK XLXI_6 full_adder
            PIN a a(5)
            PIN c_in XLXN_8
            PIN b b(5)
            PIN s s(5)
            PIN c_out XLXN_9
        END BLOCK
        BEGIN BLOCK XLXI_7 full_adder
            PIN a a(6)
            PIN c_in XLXN_9
            PIN b b(6)
            PIN s s(6)
            PIN c_out XLXN_10
        END BLOCK
        BEGIN BLOCK XLXI_8 full_adder
            PIN a a(7)
            PIN c_in XLXN_10
            PIN b b(7)
            PIN s s(7)
            PIN c_out c_out
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN BRANCH a(7:0)
            WIRE 368 304 624 304
        END BRANCH
        BEGIN BRANCH b(7:0)
            WIRE 368 384 624 384
        END BRANCH
        BEGIN BRANCH s(7:0)
            WIRE 752 352 1024 352
        END BRANCH
        IOMARKER 368 304 a(7:0) R180 28
        IOMARKER 368 384 b(7:0) R180 28
        IOMARKER 1024 352 s(7:0) R0 28
        BEGIN INSTANCE XLXI_1 352 800 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_2 912 800 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_3 1440 800 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_4 1984 800 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_5 2592 800 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_6 2608 1120 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_7 2608 1408 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_8 2624 1696 R0
        END INSTANCE
        BEGIN BRANCH XLXN_4
            WIRE 736 768 816 768
            WIRE 816 704 816 768
            WIRE 816 704 912 704
        END BRANCH
        BEGIN BRANCH XLXN_5
            WIRE 1296 768 1360 768
            WIRE 1360 704 1360 768
            WIRE 1360 704 1440 704
        END BRANCH
        BEGIN BRANCH XLXN_6
            WIRE 1824 768 1904 768
            WIRE 1904 704 1904 768
            WIRE 1904 704 1984 704
        END BRANCH
        BEGIN BRANCH XLXN_7
            WIRE 2368 768 2480 768
            WIRE 2480 704 2480 768
            WIRE 2480 704 2592 704
        END BRANCH
        BEGIN BRANCH XLXN_8
            WIRE 2528 1024 2608 1024
            WIRE 2528 1024 2528 1184
            WIRE 2528 1184 3056 1184
            WIRE 2976 768 3056 768
            WIRE 3056 768 3056 1184
        END BRANCH
        BEGIN BRANCH XLXN_9
            WIRE 2544 1312 2608 1312
            WIRE 2544 1312 2544 1488
            WIRE 2544 1488 3040 1488
            WIRE 2992 1088 3040 1088
            WIRE 3040 1088 3040 1488
        END BRANCH
        BEGIN BRANCH XLXN_10
            WIRE 2560 1424 2560 1600
            WIRE 2560 1600 2624 1600
            WIRE 2560 1424 3056 1424
            WIRE 2992 1376 3056 1376
            WIRE 3056 1376 3056 1424
        END BRANCH
        BEGIN BRANCH c_out
            WIRE 3008 1664 3040 1664
        END BRANCH
        IOMARKER 3040 1664 c_out R0 28
        BEGIN BRANCH c_in
            WIRE 320 704 352 704
        END BRANCH
        IOMARKER 320 704 c_in R180 28
        BEGIN BRANCH a(0)
            WIRE 256 640 352 640
        END BRANCH
        BEGIN BRANCH s(0)
            WIRE 736 640 768 640
        END BRANCH
        BEGIN BRANCH a(1)
            WIRE 864 640 912 640
        END BRANCH
        BEGIN BRANCH b(0)
            WIRE 256 768 352 768
        END BRANCH
        BEGIN BRANCH b(1)
            WIRE 864 768 912 768
        END BRANCH
        BEGIN BRANCH s(1)
            WIRE 1296 640 1344 640
        END BRANCH
        BEGIN BRANCH a(2)
            WIRE 1408 640 1440 640
        END BRANCH
        BEGIN BRANCH b(2)
            WIRE 1408 768 1440 768
        END BRANCH
        BEGIN BRANCH s(2)
            WIRE 1824 640 1872 640
        END BRANCH
        BEGIN BRANCH a(3)
            WIRE 1952 640 1984 640
        END BRANCH
        BEGIN BRANCH b(3)
            WIRE 1936 768 1984 768
        END BRANCH
        BEGIN BRANCH s(3)
            WIRE 2368 640 2416 640
        END BRANCH
        BEGIN BRANCH a(4)
            WIRE 2512 640 2592 640
        END BRANCH
        BEGIN BRANCH b(4)
            WIRE 2544 768 2592 768
        END BRANCH
        BEGIN BRANCH s(4)
            WIRE 2976 640 3056 640
            WIRE 3056 640 3056 656
        END BRANCH
        BEGIN BRANCH s(5)
            WIRE 2992 960 3024 960
        END BRANCH
        BEGIN BRANCH a(5)
            WIRE 2512 960 2608 960
        END BRANCH
        BEGIN BRANCH b(5)
            WIRE 2576 1088 2608 1088
        END BRANCH
        BEGIN BRANCH a(6)
            WIRE 2496 1248 2608 1248
        END BRANCH
        BEGIN BRANCH b(6)
            WIRE 2480 1376 2608 1376
        END BRANCH
        BEGIN BRANCH a(7)
            WIRE 2496 1536 2624 1536
        END BRANCH
        BEGIN BRANCH b(7)
            WIRE 2512 1664 2624 1664
        END BRANCH
        BEGIN BRANCH s(6)
            WIRE 2992 1248 3104 1248
        END BRANCH
        BEGIN BRANCH s(7)
            WIRE 3008 1536 3136 1536
        END BRANCH
    END SHEET
END SCHEMATIC
