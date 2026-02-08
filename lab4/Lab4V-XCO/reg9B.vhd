--------------------------------------------------------------------------------
-- Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 10.1
--  \   \         Application : sch2vhdl
--  /   /         Filename : reg9B.vhf
-- /___/   /\     Timestamp : 01/31/2026 18:40:22
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: C:\Xilinx\10.1\ISE\bin\nt\unwrapped\sch2vhdl.exe -intstyle ise -family spartan3a -flat -suppress -w C:/labs/Lab3Attempt5/reg9B.sch reg9B.vhf
--Design Name: reg9B
--Device: spartan3a
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesis and simulted, but it should not be modified. 
--
----- CELL FD16CE_HXILINX_reg9B -----


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FD16CE_HXILINX_reg9B is
port (
    Q   : out STD_LOGIC_VECTOR(15 downto 0);

    C   : in STD_LOGIC;
    CE  : in STD_LOGIC;
    CLR : in STD_LOGIC;
    D   : in STD_LOGIC_VECTOR(15 downto 0)
    );
end FD16CE_HXILINX_reg9B;

architecture Behavioral of FD16CE_HXILINX_reg9B is

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

----- CELL FD8CE_HXILINX_reg9B -----


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FD8CE_HXILINX_reg9B is
port (
    Q   : out STD_LOGIC_VECTOR(7 downto 0);

    C   : in STD_LOGIC;
    CE  : in STD_LOGIC;
    CLR : in STD_LOGIC;
    D   : in STD_LOGIC_VECTOR(7 downto 0)
    );
end FD8CE_HXILINX_reg9B;

architecture Behavioral of FD8CE_HXILINX_reg9B is

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


library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity reg9B is
   port ( ce  : in    std_logic; 
          clk : in    std_logic; 
          clr : in    std_logic; 
          d   : in    std_logic_vector (71 downto 0); 
          q   : out   std_logic_vector (71 downto 0));
end reg9B;

architecture BEHAVIORAL of reg9B is
   attribute HU_SET     : string ;
   component FD16CE_HXILINX_reg9B
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             D   : in    std_logic_vector (15 downto 0); 
             Q   : out   std_logic_vector (15 downto 0));
   end component;
   
   component FD8CE_HXILINX_reg9B
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             D   : in    std_logic_vector (7 downto 0); 
             Q   : out   std_logic_vector (7 downto 0));
   end component;
   
   attribute HU_SET of XLXI_1 : label is "XLXI_1_0";
   attribute HU_SET of XLXI_2 : label is "XLXI_2_1";
   attribute HU_SET of XLXI_3 : label is "XLXI_3_2";
   attribute HU_SET of XLXI_4 : label is "XLXI_4_3";
   attribute HU_SET of XLXI_5 : label is "XLXI_5_4";
begin
   XLXI_1 : FD16CE_HXILINX_reg9B
      port map (C=>clk,
                CE=>ce,
                CLR=>clr,
                D(15 downto 0)=>d(15 downto 0),
                Q(15 downto 0)=>q(15 downto 0));
   
   XLXI_2 : FD16CE_HXILINX_reg9B
      port map (C=>clk,
                CE=>ce,
                CLR=>clr,
                D(15 downto 0)=>d(31 downto 16),
                Q(15 downto 0)=>q(31 downto 16));
   
   XLXI_3 : FD16CE_HXILINX_reg9B
      port map (C=>clk,
                CE=>ce,
                CLR=>clr,
                D(15 downto 0)=>d(47 downto 32),
                Q(15 downto 0)=>q(47 downto 32));
   
   XLXI_4 : FD16CE_HXILINX_reg9B
      port map (C=>clk,
                CE=>ce,
                CLR=>clr,
                D(15 downto 0)=>d(63 downto 48),
                Q(15 downto 0)=>q(63 downto 48));
   
   XLXI_5 : FD8CE_HXILINX_reg9B
      port map (C=>clk,
                CE=>ce,
                CLR=>clr,
                D(7 downto 0)=>d(71 downto 64),
                Q(7 downto 0)=>q(71 downto 64));
   
end BEHAVIORAL;


