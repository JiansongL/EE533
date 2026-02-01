VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "spartan3a"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL out_fifo(71:0)
        SIGNAL firstword
        SIGNAL fifowrite
        SIGNAL drop_pkt
        SIGNAL lastword
        SIGNAL XLXN_6
        SIGNAL XLXN_7
        SIGNAL XLXN_8
        SIGNAL clk
        SIGNAL valid_data
        SIGNAL rst
        SIGNAL in_fifo(71:0)
        SIGNAL XLXN_16
        SIGNAL XLXN_17(0:0)
        SIGNAL XLXN_19
        SIGNAL XLXN_20(71:0)
        SIGNAL XLXN_21(7:0)
        SIGNAL XLXN_31(7:0)
        SIGNAL XLXN_32(7:0)
        SIGNAL fiforead
        SIGNAL XLXN_33
        SIGNAL XLXN_34
        SIGNAL XLXN_35
        SIGNAL XLXN_36
        SIGNAL XLXN_37
        SIGNAL XLXN_38
        SIGNAL XLXN_39
        SIGNAL XLXN_40(7:0)
        SIGNAL XLXN_41
        PORT Output out_fifo(71:0)
        PORT Input firstword
        PORT Input fifowrite
        PORT Input drop_pkt
        PORT Input lastword
        PORT Input clk
        PORT Output valid_data
        PORT Input rst
        PORT Input in_fifo(71:0)
        PORT Input fiforead
        BEGIN BLOCKDEF sync_dual_port
            TIMESTAMP 2026 1 31 22 5 6
            RECTANGLE N 32 32 544 576 
            BEGIN LINE W 0 80 32 80 
            END LINE
            BEGIN LINE W 0 112 32 112 
            END LINE
            BEGIN LINE W 0 208 32 208 
            END LINE
            LINE N 0 272 32 272 
            BEGIN LINE W 0 336 32 336 
            END LINE
            LINE N 0 528 32 528 
            BEGIN LINE W 576 336 544 336 
            END LINE
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
        BEGIN BLOCKDEF or2
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -64 64 -64 
            LINE N 0 -128 64 -128 
            LINE N 256 -96 192 -96 
            ARC N 28 -224 204 -48 112 -48 192 -96 
            ARC N -40 -152 72 -40 48 -48 48 -144 
            LINE N 112 -144 48 -144 
            ARC N 28 -144 204 32 192 -96 112 -144 
            LINE N 112 -48 48 -48 
        END BLOCKDEF
        BEGIN BLOCKDEF and2b1
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 64 -48 64 -144 
            LINE N 64 -144 144 -144 
            LINE N 144 -48 64 -48 
            ARC N 96 -144 192 -48 144 -48 144 -144 
            LINE N 256 -96 192 -96 
            LINE N 0 -128 64 -128 
            LINE N 0 -64 40 -64 
            CIRCLE N 40 -76 64 -52 
        END BLOCKDEF
        BEGIN BLOCKDEF cb8cle
            TIMESTAMP 2000 1 1 10 10 10
            RECTANGLE N 64 -448 320 -64 
            LINE N 0 -192 64 -192 
            LINE N 192 -32 64 -32 
            LINE N 192 -64 192 -32 
            LINE N 80 -128 64 -144 
            LINE N 64 -112 80 -128 
            LINE N 0 -128 64 -128 
            LINE N 0 -32 64 -32 
            LINE N 0 -256 64 -256 
            LINE N 0 -384 64 -384 
            RECTANGLE N 0 -396 64 -372 
            LINE N 384 -384 320 -384 
            LINE N 384 -192 320 -192 
            RECTANGLE N 320 -396 384 -372 
            LINE N 384 -128 320 -128 
        END BLOCKDEF
        BEGIN BLOCKDEF comp8
            TIMESTAMP 2000 1 1 10 10 10
            RECTANGLE N 64 -384 320 -64 
            LINE N 384 -224 320 -224 
            RECTANGLE N 0 -332 64 -308 
            LINE N 0 -320 64 -320 
            RECTANGLE N 0 -140 64 -116 
            LINE N 0 -128 64 -128 
        END BLOCKDEF
        BEGIN BLOCKDEF fdc
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -128 64 -128 
            LINE N 0 -32 64 -32 
            LINE N 0 -256 64 -256 
            LINE N 384 -256 320 -256 
            RECTANGLE N 64 -320 320 -64 
            LINE N 64 -112 80 -128 
            LINE N 80 -128 64 -144 
            LINE N 192 -64 192 -32 
            LINE N 192 -32 64 -32 
        END BLOCKDEF
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
        BEGIN BLOCKDEF cb8ce
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 384 -128 320 -128 
            RECTANGLE N 320 -268 384 -244 
            LINE N 384 -256 320 -256 
            LINE N 0 -192 64 -192 
            LINE N 192 -32 64 -32 
            LINE N 192 -64 192 -32 
            LINE N 80 -128 64 -144 
            LINE N 64 -112 80 -128 
            LINE N 0 -128 64 -128 
            LINE N 0 -32 64 -32 
            LINE N 384 -192 320 -192 
            RECTANGLE N 64 -320 320 -64 
        END BLOCKDEF
        BEGIN BLOCKDEF and3b2
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -64 40 -64 
            CIRCLE N 40 -76 64 -52 
            LINE N 0 -128 40 -128 
            CIRCLE N 40 -140 64 -116 
            LINE N 0 -192 64 -192 
            LINE N 256 -128 192 -128 
            LINE N 64 -64 64 -192 
            ARC N 96 -176 192 -80 144 -80 144 -176 
            LINE N 144 -80 64 -80 
            LINE N 64 -176 144 -176 
        END BLOCKDEF
        BEGIN BLOCKDEF vcc
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 64 -32 64 -64 
            LINE N 64 0 64 -32 
            LINE N 96 -64 32 -64 
        END BLOCKDEF
        BEGIN BLOCK XLXI_1 sync_dual_port
            PIN addra(7:0) XLXN_40(7:0)
            PIN dina(71:0) XLXN_20(71:0)
            PIN wea(0:0) XLXN_17(0:0)
            PIN clka clk
            PIN addrb(7:0) XLXN_32(7:0)
            PIN clkb clk
            PIN doutb(71:0) out_fifo(71:0)
        END BLOCK
        BEGIN BLOCK XLXI_2 fd
            PIN C clk
            PIN D firstword
            PIN Q XLXN_7
        END BLOCK
        BEGIN BLOCK XLXI_3 fd
            PIN C clk
            PIN D lastword
            PIN Q XLXN_8
        END BLOCK
        BEGIN BLOCK XLXI_4 fd
            PIN C clk
            PIN D fifowrite
            PIN Q XLXN_17(0:0)
        END BLOCK
        BEGIN BLOCK XLXI_5 fd
            PIN C clk
            PIN D drop_pkt
            PIN Q XLXN_16
        END BLOCK
        BEGIN BLOCK XLXI_6 or2
            PIN I0 XLXN_8
            PIN I1 XLXN_7
            PIN O XLXN_6
        END BLOCK
        BEGIN BLOCK XLXI_7 and2b1
            PIN I0 XLXN_16
            PIN I1 XLXN_6
            PIN O XLXN_19
        END BLOCK
        BEGIN BLOCK XLXI_8 cb8cle
            PIN C clk
            PIN CE XLXN_17(0:0)
            PIN CLR rst
            PIN D(7:0) XLXN_31(7:0)
            PIN L XLXN_16
            PIN CEO
            PIN Q(7:0) XLXN_40(7:0)
            PIN TC
        END BLOCK
        BEGIN BLOCK XLXI_11 comp8
            PIN A(7:0) XLXN_40(7:0)
            PIN B(7:0) XLXN_32(7:0)
            PIN EQ XLXN_36
        END BLOCK
        BEGIN BLOCK XLXI_12 comp8
            PIN A(7:0) XLXN_32(7:0)
            PIN B(7:0) XLXN_31(7:0)
            PIN EQ XLXN_37
        END BLOCK
        BEGIN BLOCK XLXI_13 fdc
            PIN C clk
            PIN CLR rst
            PIN D XLXN_38
            PIN Q valid_data
        END BLOCK
        BEGIN BLOCK XLXI_14 reg9B
            PIN d(71:0) in_fifo(71:0)
            PIN clk clk
            PIN ce XLXN_41
            PIN clr rst
            PIN q(71:0) XLXN_20(71:0)
        END BLOCK
        BEGIN BLOCK XLXI_15 fd8ce
            PIN C clk
            PIN CE XLXN_19
            PIN CLR rst
            PIN D(7:0) XLXN_40(7:0)
            PIN Q(7:0) XLXN_31(7:0)
        END BLOCK
        BEGIN BLOCK XLXI_17 cb8ce
            PIN C rst
            PIN CE XLXN_38
            PIN CLR rst
            PIN CEO
            PIN Q(7:0) XLXN_32(7:0)
            PIN TC
        END BLOCK
        BEGIN BLOCK XLXI_18 and3b2
            PIN I0 XLXN_37
            PIN I1 XLXN_36
            PIN I2 fiforead
            PIN O XLXN_38
        END BLOCK
        BEGIN BLOCK XLXI_21 vcc
            PIN P XLXN_41
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN INSTANCE XLXI_1 2512 1120 R0
        END INSTANCE
        BEGIN BRANCH out_fifo(71:0)
            WIRE 3088 1456 3120 1456
        END BRANCH
        IOMARKER 3120 1456 out_fifo(71:0) R0 28
        INSTANCE XLXI_2 496 496 R0
        INSTANCE XLXI_3 496 880 R0
        INSTANCE XLXI_4 1360 512 R0
        INSTANCE XLXI_5 544 2256 R0
        BEGIN BRANCH firstword
            WIRE 464 240 496 240
        END BRANCH
        IOMARKER 464 240 firstword R180 28
        BEGIN BRANCH fifowrite
            WIRE 1328 256 1360 256
        END BRANCH
        IOMARKER 1328 256 fifowrite R180 28
        BEGIN BRANCH drop_pkt
            WIRE 512 2000 544 2000
        END BRANCH
        IOMARKER 512 2000 drop_pkt R180 28
        BEGIN BRANCH lastword
            WIRE 464 624 496 624
        END BRANCH
        IOMARKER 464 624 lastword R180 28
        INSTANCE XLXI_6 1040 656 R0
        BEGIN BRANCH XLXN_6
            WIRE 1296 560 1328 560
        END BRANCH
        INSTANCE XLXI_7 1328 688 R0
        BEGIN BRANCH XLXN_7
            WIRE 880 240 960 240
            WIRE 960 240 960 528
            WIRE 960 528 1040 528
        END BRANCH
        BEGIN BRANCH XLXN_8
            WIRE 880 624 960 624
            WIRE 960 592 960 624
            WIRE 960 592 1040 592
        END BRANCH
        BEGIN BRANCH clk
            WIRE 128 2128 240 2128
            WIRE 240 2128 544 2128
            WIRE 176 480 176 880
            WIRE 176 880 240 880
            WIRE 240 880 240 1104
            WIRE 240 1104 240 2128
            WIRE 240 1104 512 1104
            WIRE 176 480 1664 480
            WIRE 1664 480 1664 592
            WIRE 1664 592 1664 1168
            WIRE 1664 1168 1680 1168
            WIRE 1664 1168 1664 1392
            WIRE 1664 1392 1776 1392
            WIRE 1776 1392 2368 1392
            WIRE 2368 1392 2512 1392
            WIRE 2368 1392 2368 1648
            WIRE 2368 1648 2512 1648
            WIRE 1776 1392 1776 1424
            WIRE 1664 592 2320 592
            WIRE 240 368 496 368
            WIRE 240 368 240 528
            WIRE 240 528 896 528
            WIRE 240 528 240 752
            WIRE 240 752 496 752
            WIRE 240 752 240 880
            WIRE 896 384 896 528
            WIRE 896 384 1360 384
            WIRE 1680 1424 1680 2032
            WIRE 1680 2032 1760 2032
            WIRE 1680 1424 1776 1424
        END BRANCH
        IOMARKER 128 2128 clk R180 28
        INSTANCE XLXI_8 1680 1296 R0
        INSTANCE XLXI_11 880 1600 R0
        INSTANCE XLXI_12 880 1968 R0
        BEGIN BRANCH valid_data
            WIRE 2144 1904 2304 1904
        END BRANCH
        BEGIN BRANCH rst
            WIRE 512 1200 512 1552
            WIRE 512 1552 1552 1552
            WIRE 1552 1552 1552 1968
            WIRE 1552 1968 1552 2128
            WIRE 1552 2128 1552 2192
            WIRE 1552 2192 2192 2192
            WIRE 1552 2128 1760 2128
            WIRE 1552 1968 1696 1968
            WIRE 1408 1264 1552 1264
            WIRE 1552 1264 1680 1264
            WIRE 1552 1264 1552 1280
            WIRE 1552 1280 1552 1552
            WIRE 1552 1280 1728 1280
            WIRE 1728 1280 1728 1776
            WIRE 1728 1776 1744 1776
            WIRE 1696 1680 1696 1968
            WIRE 1696 1680 1744 1680
            WIRE 2192 464 2320 464
            WIRE 2192 464 2192 2192
        END BRANCH
        IOMARKER 1408 1264 rst R180 28
        BEGIN INSTANCE XLXI_14 2320 432 R0
        END INSTANCE
        BEGIN BRANCH in_fifo(71:0)
            WIRE 2288 272 2320 272
        END BRANCH
        IOMARKER 2288 272 in_fifo(71:0) R180 28
        BEGIN BRANCH XLXN_16
            WIRE 928 2000 1312 2000
            WIRE 1312 624 1328 624
            WIRE 1312 624 1312 1024
            WIRE 1312 1024 1312 1040
            WIRE 1312 1040 1312 2000
            WIRE 1312 1040 1680 1040
        END BRANCH
        BEGIN BRANCH XLXN_17(0:0)
            WIRE 1504 688 1504 1104
            WIRE 1504 1104 1680 1104
            WIRE 1504 688 2096 688
            WIRE 2096 688 2096 1328
            WIRE 2096 1328 2512 1328
            WIRE 1744 256 2096 256
            WIRE 2096 256 2096 688
        END BRANCH
        INSTANCE XLXI_15 512 1232 R0
        BEGIN BRANCH XLXN_19
            WIRE 496 832 496 1040
            WIRE 496 1040 512 1040
            WIRE 496 832 1632 832
            WIRE 1584 592 1632 592
            WIRE 1632 592 1632 832
        END BRANCH
        BEGIN BRANCH XLXN_20(71:0)
            WIRE 2432 1232 2512 1232
            WIRE 2432 1232 2432 1760
            WIRE 2432 1760 3392 1760
            WIRE 2704 272 3392 272
            WIRE 3392 272 3392 1760
        END BRANCH
        BEGIN BRANCH XLXN_31(7:0)
            WIRE 816 1840 880 1840
            WIRE 816 1840 816 1920
            WIRE 816 1920 1280 1920
            WIRE 896 976 1280 976
            WIRE 1280 976 1280 1920
            WIRE 1280 912 1280 976
            WIRE 1280 912 1680 912
        END BRANCH
        BEGIN BRANCH XLXN_32(7:0)
            WIRE 720 1472 880 1472
            WIRE 720 1472 720 1568
            WIRE 720 1568 720 1648
            WIRE 720 1648 880 1648
            WIRE 720 1568 1344 1568
            WIRE 1344 1456 1344 1568
            WIRE 1344 1456 2128 1456
            WIRE 2128 1456 2144 1456
            WIRE 2144 1456 2512 1456
            WIRE 2144 1456 2144 1552
            WIRE 2128 1552 2144 1552
        END BRANCH
        BEGIN BRANCH fiforead
            WIRE 1376 1536 1408 1536
            WIRE 1408 1536 1408 1664
        END BRANCH
        IOMARKER 1376 1536 fiforead R180 28
        IOMARKER 2304 1904 valid_data R0 28
        INSTANCE XLXI_17 1744 1808 R0
        INSTANCE XLXI_18 1408 1856 R0
        INSTANCE XLXI_13 1760 2160 R0
        BEGIN BRANCH XLXN_36
            WIRE 1264 1376 1392 1376
            WIRE 1392 1376 1392 1728
            WIRE 1392 1728 1408 1728
        END BRANCH
        BEGIN BRANCH XLXN_37
            WIRE 1264 1744 1328 1744
            WIRE 1328 1744 1328 1792
            WIRE 1328 1792 1408 1792
        END BRANCH
        BEGIN BRANCH XLXN_38
            WIRE 1664 1728 1712 1728
            WIRE 1712 1728 1712 1904
            WIRE 1712 1904 1760 1904
            WIRE 1712 1616 1744 1616
            WIRE 1712 1616 1712 1728
        END BRANCH
        BEGIN BRANCH XLXN_40(7:0)
            WIRE 480 464 480 976
            WIRE 480 976 512 976
            WIRE 480 976 480 1280
            WIRE 480 1280 880 1280
            WIRE 480 464 2128 464
            WIRE 2128 464 2128 912
            WIRE 2128 912 2128 1200
            WIRE 2128 1200 2512 1200
            WIRE 2064 912 2128 912
        END BRANCH
        BEGIN BRANCH XLXN_41
            WIRE 2304 176 2304 400
            WIRE 2304 400 2320 400
        END BRANCH
        INSTANCE XLXI_21 2240 176 R0
    END SHEET
END SCHEMATIC
