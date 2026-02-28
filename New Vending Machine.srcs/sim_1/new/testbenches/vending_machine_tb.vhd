library IEEE; 
use IEEE.STD_LOGIC_1164.ALL; 
use IEEE.NUMERIC_STD.ALL; 


entity vending_machine_tb is 
end vending_machine_tb; 

architecture behaviorial of vending_machine_tb is
    component vending_machine is
        port( 
            vend : in std_logic_vector(7 downto 0); 
            clk, rst, refund, quarter, dollar : in std_logic; 
            display : out std_logic_vector(27 downto 0); 
            vend_out : out std_logic
        ); 
    end component; 

    signal clk, rst : std_logic := '0'; 
    signal refund, quarter, dollar : std_logic := '0'; 
    signal display : std_logic_vector(27 downto 0) := (others=>'0'); 
    signal vend : std_logic_vector(7 downto 0) := (others=>'0'); 
    signal vend_out : std_logic := '0'; 

begin
    UUT: vending_machine 
        port map(
            clk => clk, 
            rst => rst, 
            refund => refund, 
            quarter => quarter, 
            dollar => dollar, 
            display => display, 
            vend => vend, 
            vend_out => vend_out
        ); 
    
    clk_process : process(clk) begin 
        clk <= '0'; 
        wait for 10 ns; 
        clk <= '1'; 
        wait for 10 ns; 
    end process; 
    
    process(clk) begin 
        rst <= '1'; 
        wait for 20 ns; 
        rst <= '0'; 
        refund <= '0'; 
        quarter <= '0'; 
        dollar <= '0'; 
        vend <= (others=>'0'); 
        wait for 20 ns; 
        rst <= '1';
        wait for 40 ns;
        rst <= '0';
        wait for 40 ns;

        dollar <= '1';
        wait for 20 ns; 
        dollar <= '0';
        wait for 80 ns; 

        quarter <= '1';
        wait for 20 ns;
        quarter <= '0';
        wait for 80 ns;

        vend(1) <= '1';
        wait for 20 ns;
        vend(1) <= '0';
    
        wait for 100 ns;

        assert false report "Passed the TB!" severity note; 
    end process; 
end behaviorial; 