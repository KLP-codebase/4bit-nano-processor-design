----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.04.2026 19:12:24
-- Design Name: 
-- Module Name: Register_Bank - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Register_Bank is
    Port ( value_in : in STD_LOGIC_VECTOR (3 downto 0);
           clk : in STD_LOGIC;
           Reg_Enable : in STD_LOGIC_VECTOR (2 downto 0);
           reset : in STD_LOGIC;
           R0 : out STD_LOGIC_VECTOR (3 downto 0);
           R1 : out STD_LOGIC_VECTOR (3 downto 0);
           R2 : out STD_LOGIC_VECTOR (3 downto 0);
           R3 : out STD_LOGIC_VECTOR (3 downto 0);
           R4 : out STD_LOGIC_VECTOR (3 downto 0);
           R5 : out STD_LOGIC_VECTOR (3 downto 0);
           R6 : out STD_LOGIC_VECTOR (3 downto 0);
           R7 : out STD_LOGIC_VECTOR (3 downto 0));
end Register_Bank;

architecture Behavioral of Register_Bank is

    component Decoder_3_to_8
        Port (
            I  : in STD_LOGIC_VECTOR;
            EN : in STD_LOGIC;
            Y  : out STD_LOGIC_VECTOR
        );
    end component;

component clk_based_Reg_4B
        Port (
            D     : in STD_LOGIC_VECTOR(3 downto 0);
            Enable    : in STD_LOGIC;
            Clk   : in STD_LOGIC;
            reset : in STD_LOGIC;
            Q     : out STD_LOGIC_VECTOR(3 downto 0) := "0000"
        );
end component;

    signal reg_en_out : STD_LOGIC_VECTOR(7 downto 0);

begin

    -- Decoder to enable only one register based on Reg_En
    Decode_3_to_8_0 : Decoder_3_to_8
        Port map (
            I  => Reg_Enable,
            EN => '1',
            Y  => reg_en_out
        );

    -- R0 is hardcoded to 0000 
    Reg_0 : clk_based_Reg_4B
        Port map (
            D     => "0000",
            Enable    => '1',
            Clk   => clk,
            reset => reset,
            Q     => R0
        );

    Reg_1 : clk_based_Reg_4B
        Port map (
            D     => Value_In,
            Enable    => reg_en_out(1),
            Clk   => clk,
            reset => reset,
            Q     => R1
        );

    Reg_2 : clk_based_Reg_4B
        Port map (
            D     => Value_In,
            Enable    => reg_en_out(2),
            Clk   => clk,
            Reset => Reset,
            Q     => R2
        );

    Reg_3 : clk_based_Reg_4B
        Port map (
            D     => Value_In,
            Enable    => reg_en_out(3),
            Clk   => clk,
            Reset => Reset,
            Q     => R3
        );

    Reg_4 : clk_based_Reg_4B
        Port map (
            D     => Value_In,
            Enable    => reg_en_out(4),
            Clk   => clk,
            reset => reset,
            Q     => R4
        );

    Reg_5 : clk_based_Reg_4B
        Port map (
            D     => Value_In,
            Enable    => reg_en_out(5),
            Clk   => clk,
            reset => reset,
            Q     => R5
        );

    Reg_6 : clk_based_Reg_4B
        Port map (
            D     => Value_In,
            Enable    => reg_en_out(6),
            Clk   => Clk,
            reset => reset,
            Q     => R6
        );

    Reg_7 : clk_based_Reg_4B
        Port map (
            D     => Value_In,
            Enable    => reg_en_out(7),
            Clk   => Clk,
            reset => reset,
            Q     => R7
        );

end Behavioral;
