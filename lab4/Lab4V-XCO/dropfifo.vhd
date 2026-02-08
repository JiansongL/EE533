--------------------------------------------------------------------------------
-- Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 10.1
--  \   \         Application : sch2vhdl
--  /   /         Filename : dropfifo.vhf
-- /___/   /\     Timestamp : 01/31/2026 18:40:21
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: C:\Xilinx\10.1\ISE\bin\nt\unwrapped\sch2vhdl.exe -intstyle ise -family spartan3a -flat -suppress -w C:/labs/Lab3Attempt5/dropfifo.sch dropfifo.vhf
--Design Name: dropfifo
--Device: spartan3a
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesis and simulted, but it should not be modified. 
--
----- CELL FD8CE_HXILINX_dropfifo -----


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FD8CE_HXILINX_dropfifo is
port (
    Q   : out STD_LOGIC_VECTOR(7 downto 0);

    C   : in STD_LOGIC;
    CE  : in STD_LOGIC;
    CLR : in STD_LOGIC;
    D   : in STD_LOGIC_VECTOR(7 downto 0)
    );
end FD8CE_HXILINX_dropfifo;

architecture Behavioral of FD8CE_HXILINX_dropfifo is

begin

process(C, CLR)
begin
  if (CLR='1') then
    Q <= (others => '0');
  elsif (C'event and C = '1') then
    if (CE='1') then 
      Q <= D;
    end if;
  end if;
end process;


end Behavioral;

----- CELL CB8CLE_HXILINX_dropfifo -----

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CB8CLE_HXILINX_dropfifo is
port (
    CEO : out STD_LOGIC;
    Q   : out STD_LOGIC_VECTOR(7 downto 0);
    TC  : out STD_LOGIC;
    C   : in STD_LOGIC;
    CE  : in STD_LOGIC;
    CLR : in STD_LOGIC;
    D   : in STD_LOGIC_VECTOR (7 downto 0);	
    L   : in STD_LOGIC );
end CB8CLE_HXILINX_dropfifo;

architecture Behavioral of CB8CLE_HXILINX_dropfifo is

  signal COUNT : STD_LOGIC_VECTOR(7 downto 0);
  constant TERMINAL_COUNT : STD_LOGIC_VECTOR(7 downto 0) := (others => '1');

begin

process(C, CLR)
begin
  if (CLR='1') then
    COUNT <= (others => '0');
  elsif (C'event and C ='1') then
    if (L = '1') then
      COUNT <= D;
    elsif (CE='1') then 
      COUNT <= COUNT+1;
    end if;
  end if;
end process;

TC  <= '1' when (COUNT = TERMINAL_COUNT) else '0'; 
CEO <= '1' when ((COUNT = TERMINAL_COUNT) and CE='1') else '0'; 
Q   <= COUNT;

end Behavioral;
----- CELL CB8CE_HXILINX_dropfifo -----


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CB8CE_HXILINX_dropfifo is
port (
    CEO : out STD_LOGIC;
    Q   : out STD_LOGIC_VECTOR(7 downto 0);
    TC  : out STD_LOGIC;
    C   : in STD_LOGIC;
    CE  : in STD_LOGIC;
    CLR : in STD_LOGIC
    );
end CB8CE_HXILINX_dropfifo;

architecture Behavioral of CB8CE_HXILINX_dropfifo is

  signal COUNT : STD_LOGIC_VECTOR(7 downto 0);
  constant TERMINAL_COUNT : STD_LOGIC_VECTOR(7 downto 0) := (others => '1');
  
begin

process(C, CLR)
begin
  if (CLR='1') then
    COUNT <= (others => '0');
  elsif (C'event and C = '1') then
    if (CE='1') then 
      COUNT <= COUNT+1;
    end if;
  end if;
end process;

TC  <= '1' when (COUNT = TERMINAL_COUNT) else '0';
CEO <= '1' when ((COUNT = TERMINAL_COUNT) and CE='1') else '0';
Q   <= COUNT;

end Behavioral;


library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity comp8_MUSER_dropfifo is
   port ( A  : in    std_logic_vector (7 downto 0); 
          B  : in    std_logic_vector (7 downto 0); 
          EQ : out   std_logic);
end comp8_MUSER_dropfifo;

architecture BEHAVIORAL of comp8_MUSER_dropfifo is
   attribute BOX_TYPE   : string ;
   signal AB0  : std_logic;
   signal AB1  : std_logic;
   signal AB2  : std_logic;
   signal AB3  : std_logic;
   signal AB4  : std_logic;
   signal AB5  : std_logic;
   signal AB6  : std_logic;
   signal AB7  : std_logic;
   signal AB03 : std_logic;
   signal AB47 : std_logic;
   component AND4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4 : component is "BLACK_BOX";
   
   component XNOR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of XNOR2 : component is "BLACK_BOX";
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
begin
   I_36_32 : AND4
      port map (I0=>AB7,
                I1=>AB6,
                I2=>AB5,
                I3=>AB4,
                O=>AB47);
   
   I_36_33 : XNOR2
      port map (I0=>B(6),
                I1=>A(6),
                O=>AB6);
   
   I_36_34 : XNOR2
      port map (I0=>B(7),
                I1=>A(7),
                O=>AB7);
   
   I_36_35 : XNOR2
      port map (I0=>B(5),
                I1=>A(5),
                O=>AB5);
   
   I_36_36 : XNOR2
      port map (I0=>B(4),
                I1=>A(4),
                O=>AB4);
   
   I_36_41 : AND4
      port map (I0=>AB3,
                I1=>AB2,
                I2=>AB1,
                I3=>AB0,
                O=>AB03);
   
   I_36_42 : XNOR2
      port map (I0=>B(2),
                I1=>A(2),
                O=>AB2);
   
   I_36_43 : XNOR2
      port map (I0=>B(3),
                I1=>A(3),
                O=>AB3);
   
   I_36_44 : XNOR2
      port map (I0=>B(1),
                I1=>A(1),
                O=>AB1);
   
   I_36_45 : XNOR2
      port map (I0=>B(0),
                I1=>A(0),
                O=>AB0);
   
   I_36_50 : AND2
      port map (I0=>AB47,
                I1=>AB03,
                O=>EQ);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity dropfifo is
   port ( clk        : in    std_logic; 
          drop_pkt   : in    std_logic; 
          fiforead   : in    std_logic; 
          fifowrite  : in    std_logic; 
          firstword  : in    std_logic; 
          in_fifo    : in    std_logic_vector (71 downto 0); 
          lastword   : in    std_logic; 
          rst        : in    std_logic; 
          out_fifo   : out   std_logic_vector (71 downto 0); 
          valid_data : out   std_logic);
end dropfifo;

architecture BEHAVIORAL of dropfifo is
   attribute INIT       : string ;
   attribute BOX_TYPE   : string ;
   attribute HU_SET     : string ;
   signal in_fifo0   : std_logic_vector (71 downto 0);
   signal XLXN_24    : std_logic;
   signal XLXN_25    : std_logic;
   signal XLXN_27    : std_logic_vector (7 downto 0);
   signal XLXN_28    : std_logic_vector (7 downto 0);
   signal XLXN_29    : std_logic;
   signal XLXN_31    : std_logic;
   signal XLXN_32    : std_logic;
   signal XLXN_35    : std_logic;
   signal XLXN_36    : std_logic;
   signal XLXN_87    : std_logic_vector (7 downto 0);
   signal XLXN_89    : std_logic;
   signal XLXN_92    : std_logic;
   signal XLXN_94    : std_logic;
   component FD
      -- synopsys translate_off
      generic( INIT : bit :=  '0');
      -- synopsys translate_on
      port ( C : in    std_logic; 
             D : in    std_logic; 
             Q : out   std_logic);
   end component;
   attribute INIT of FD : component is "0";
   attribute BOX_TYPE of FD : component is "BLACK_BOX";
   
   component FD8CE_HXILINX_dropfifo
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             D   : in    std_logic_vector (7 downto 0); 
             Q   : out   std_logic_vector (7 downto 0));
   end component;
   
   component OR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
   
   component comp8_MUSER_dropfifo
      port ( B  : in    std_logic_vector (7 downto 0); 
             A  : in    std_logic_vector (7 downto 0); 
             EQ : out   std_logic);
   end component;
   
   component AND2B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2B1 : component is "BLACK_BOX";
   
   component AND3B2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3B2 : component is "BLACK_BOX";
   
   component CB8CLE_HXILINX_dropfifo
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             D   : in    std_logic_vector (7 downto 0); 
             L   : in    std_logic; 
             CEO : out   std_logic; 
             Q   : out   std_logic_vector (7 downto 0); 
             TC  : out   std_logic);
   end component;
   
   component CB8CE_HXILINX_dropfifo
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             CEO : out   std_logic; 
             Q   : out   std_logic_vector (7 downto 0); 
             TC  : out   std_logic);
   end component;
   
   component FDC
      -- synopsys translate_off
      generic( INIT : bit :=  '0');
      -- synopsys translate_on
      port ( C   : in    std_logic; 
             CLR : in    std_logic; 
             D   : in    std_logic; 
             Q   : out   std_logic);
   end component;
   attribute INIT of FDC : component is "0";
   attribute BOX_TYPE of FDC : component is "BLACK_BOX";
   
   component reg9B
      port ( d   : in    std_logic_vector (71 downto 0); 
             clr : in    std_logic; 
             clk : in    std_logic; 
             ce  : in    std_logic; 
             q   : out   std_logic_vector (71 downto 0));
   end component;
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   component dualportmem
      port ( addra : in    std_logic_vector (7 downto 0); 
             dina  : in    std_logic_vector (71 downto 0); 
             wea   : in    std_logic_vector (0 downto 0); 
             clka  : in    std_logic; 
             addrb : in    std_logic_vector (7 downto 0); 
             clkb  : in    std_logic; 
             doutb : out   std_logic_vector (71 downto 0));
   end component;
   
   attribute HU_SET of XLXI_4 : label is "XLXI_4_0";
   attribute HU_SET of XLXI_15 : label is "XLXI_15_1";
   attribute HU_SET of XLXI_16 : label is "XLXI_16_2";
begin
   XLXI_1 : FD
      port map (C=>clk,
                D=>firstword,
                Q=>XLXN_24);
   
   XLXI_2 : FD
      port map (C=>clk,
                D=>lastword,
                Q=>XLXN_25);
   
   XLXI_3 : FD
      port map (C=>clk,
                D=>drop_pkt,
                Q=>XLXN_36);
   
   XLXI_4 : FD8CE_HXILINX_dropfifo
      port map (C=>clk,
                CE=>XLXN_35,
                CLR=>rst,
                D(7 downto 0)=>XLXN_28(7 downto 0),
                Q(7 downto 0)=>XLXN_87(7 downto 0));
   
   XLXI_5 : OR2
      port map (I0=>XLXN_25,
                I1=>XLXN_24,
                O=>XLXN_32);
   
   XLXI_6 : comp8_MUSER_dropfifo
      port map (A(7 downto 0)=>XLXN_28(7 downto 0),
                B(7 downto 0)=>XLXN_27(7 downto 0),
                EQ=>XLXN_29);
   
   XLXI_7 : comp8_MUSER_dropfifo
      port map (A(7 downto 0)=>XLXN_27(7 downto 0),
                B(7 downto 0)=>XLXN_87(7 downto 0),
                EQ=>XLXN_31);
   
   XLXI_10 : FD
      port map (C=>clk,
                D=>fifowrite,
                Q=>XLXN_89);
   
   XLXI_11 : AND2B1
      port map (I0=>XLXN_36,
                I1=>XLXN_32,
                O=>XLXN_35);
   
   XLXI_12 : AND3B2
      port map (I0=>XLXN_31,
                I1=>XLXN_29,
                I2=>fiforead,
                O=>XLXN_92);
   
   XLXI_15 : CB8CLE_HXILINX_dropfifo
      port map (C=>clk,
                CE=>XLXN_89,
                CLR=>rst,
                D(7 downto 0)=>XLXN_87(7 downto 0),
                L=>XLXN_36,
                CEO=>open,
                Q(7 downto 0)=>XLXN_28(7 downto 0),
                TC=>open);
   
   XLXI_16 : CB8CE_HXILINX_dropfifo
      port map (C=>clk,
                CE=>XLXN_92,
                CLR=>rst,
                CEO=>open,
                Q(7 downto 0)=>XLXN_27(7 downto 0),
                TC=>open);
   
   XLXI_17 : FDC
      port map (C=>clk,
                CLR=>rst,
                D=>XLXN_92,
                Q=>valid_data);
   
   XLXI_49 : reg9B
      port map (ce=>XLXN_94,
                clk=>clk,
                clr=>rst,
                d(71 downto 0)=>in_fifo(71 downto 0),
                q(71 downto 0)=>in_fifo0(71 downto 0));
   
   XLXI_54 : VCC
      port map (P=>XLXN_94);
   
   XLXI_55 : dualportmem
      port map (addra(7 downto 0)=>XLXN_28(7 downto 0),
                addrb(7 downto 0)=>XLXN_27(7 downto 0),
                clka=>clk,
                clkb=>clk,
                dina(71 downto 0)=>in_fifo0(71 downto 0),
                wea(0)=>XLXN_89,
                doutb(71 downto 0)=>out_fifo(71 downto 0));
   
end BEHAVIORAL;


