
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity PROCESADOR is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           RESULT : out  STD_LOGIC_VECTOR (31 downto 0));
end PROCESADOR;

architecture Behavioral of PROCESADOR is
	-- FETCH AND DECODE
	COMPONENT PIPE_FETCH
	PORT(
		CLK : IN std_logic;
		RST : IN std_logic;
		PC_IN : IN std_logic_vector(31 downto 0);
		SDISP22_IN : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		SDISP30_IN : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		INSTRUCTION_IN : IN std_logic_vector(31 downto 0);
		RFDEST_IN : IN std_logic;
		WE_IN : IN std_logic;
		CWP_IN : IN std_logic_vector(0 to 0);
		ICC_IN : IN std_logic_vector(3 downto 0);
		DATATOREG_IN : IN std_logic_vector(31 downto 0);          
		PC_OUT : OUT std_logic_vector(31 downto 0);
		SDISP22_OUT : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
		SDISP30_OUT : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
		INSTRUCTION_OUT : OUT std_logic_vector(31 downto 0);
		RFDEST_OUT : OUT std_logic;
		WE_OUT : OUT std_logic;
		CWP_OUT : OUT std_logic_vector(0 to 0);
		ICC_OUT : OUT std_logic_vector(3 downto 0);
		DATATOREG_OUT : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	-- DECODE AND EXECUTE
	COMPONENT PIPE_DECODE
	PORT(
		CLK : IN std_logic;
		RST : IN std_logic;
		PC_IN : IN std_logic_vector(31 downto 0);
		PCSOURCE_IN : IN std_logic_vector(1 downto 0);
		ALUOP_IN : IN std_logic_vector(5 downto 0);
		WRDENMEM_IN : IN std_logic;
		RFSOURCE_IN : IN std_logic_vector(1 downto 0);
		RFDEST_IN : IN std_logic;
		WE_IN : IN std_logic;
		CRS1_IN : IN std_logic_vector(31 downto 0);
		CRD_IN : IN std_logic_vector(31 downto 0);
		OP2_IN : IN std_logic_vector(31 downto 0);
		NCWP_IN : IN std_logic_vector(0 to 0);
		PC_OUT : OUT std_logic_vector(31 downto 0);
		PCSOURCE_OUT : OUT std_logic_vector(1 downto 0);
		ALUOP_OUT : OUT std_logic_vector(5 downto 0);
		WRDENMEM_OUT : OUT std_logic;
		RFSOURCE_OUT : OUT std_logic_vector(1 downto 0);
		RFDEST_OUT : OUT std_logic;
		WE_OUT : OUT std_logic;
		CRS1_OUT : OUT std_logic_vector(31 downto 0);
		CRD_OUT : OUT std_logic_vector(31 downto 0);
		OP2_OUT : OUT std_logic_vector(31 downto 0);
		NCWP_OUT : OUT std_logic_vector(0 to 0)
		);
	END COMPONENT;
	-- EXECUTE AND MEMORY
	COMPONENT PIPE_EXECUTE
	PORT(
		CLK : IN std_logic;
		RST : IN std_logic;
		ALURESULT_IN : IN std_logic_vector(31 downto 0);
		ICC_IN : IN std_logic_vector(3 downto 0);
		CWP_IN : IN std_logic_vector(0 to 0);
		WRDENMEM_IN : IN std_logic;
		RFDEST_IN : IN std_logic;
		WE_IN : IN std_logic;
		RFSOURCE_IN : IN std_logic_vector(1 downto 0);
		PC_IN : IN std_logic_vector(31 downto 0);
		CRD_IN : IN std_logic_vector(31 downto 0);          
		ALURESULT_OUT : OUT std_logic_vector(31 downto 0);
		ICC_OUT : OUT std_logic_vector(3 downto 0);
		CWP_OUT : OUT std_logic_vector(0 to 0);
		WRDENMEM_OUT : OUT std_logic;
		RFDEST_OUT : OUT std_logic;
		WE_OUT : OUT std_logic;
		RFSOURCE_OUT : OUT std_logic_vector(1 downto 0);
		PC_OUT : OUT std_logic_vector(31 downto 0);
		CRD_OUT : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	--EXECUTE AND MEMORY
	COMPONENT PIPE_MEMORY
	PORT(
		CLK : IN std_logic;
		RST : IN std_logic;
		ALURESULT_IN : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		RFSOURCE_IN : IN std_logic_vector(1 downto 0);
		DATATOMEM_IN : IN std_logic_vector(31 downto 0);
		PC_IN : IN std_logic_vector(31 downto 0);
		ICC_IN : IN std_logic_vector(3 downto 0);
		CWP_IN : IN std_logic_vector(0 to 0);
		RFDEST_IN : IN std_logic;
		WE_IN : IN std_logic;
		ALURESULT_OUT : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
		RFSOURCE_OUT : OUT std_logic_vector(1 downto 0);
		DATATOMEM_OUT : OUT std_logic_vector(31 downto 0);
		PC_OUT : OUT std_logic_vector(31 downto 0);
		ICC_OUT : OUT std_logic_vector(3 downto 0);
		CWP_OUT : OUT std_logic_vector(0 to 0);
		RFDEST_OUT : OUT std_logic;
		WE_OUT : OUT std_logic
		);
	END COMPONENT;
	-- MEMORY AND RESULT
	COMPONENT PIPE_RESULT
	PORT(
		CLK : IN std_logic;
		RST : IN std_logic;
		DATATOREG_IN : IN std_logic_vector(31 downto 0);
		ICC_IN : IN std_logic_vector(3 downto 0);
		CWP_IN : IN std_logic_vector(0 to 0);
		WE_IN : IN std_logic;
		RFDEST_IN : IN std_logic;          
		DATATOREG_OUT : OUT std_logic_vector(31 downto 0);
		ICC_OUT : OUT std_logic_vector(3 downto 0);
		CWP_OUT : OUT std_logic_vector(0 to 0);
		WE_OUT : OUT std_logic;
		RFDEST_OUT : OUT std_logic
		);
	END COMPONENT;
	--PC AND NPC
	COMPONENT PC_MODULE
	PORT(
		CLK : IN std_logic;
		RST : IN std_logic;
		INSTR : IN std_logic_vector(31 downto 0);          
		PC : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	--PC + SEU(DISP22)
	COMPONENT ALU_BR_MODULE
	PORT(
		SDISP22 : IN std_logic_vector(31 downto 0);
		PC : IN std_logic_vector(31 downto 0);          
		BRANCHS : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	--PC + SEU(DISP30)
	COMPONENT ALU_CALL_MODULE
	PORT(
		SDISP30 : IN std_logic_vector(31 downto 0);
		PC : IN std_logic_vector(31 downto 0);          
		CALL : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	--ALU
	COMPONENT ALU_MODULE
	PORT(
		ALUOP : IN std_logic_vector(5 downto 0);
		CRS1 : IN std_logic_vector(31 downto 0);
		OP2 : IN std_logic_vector(31 downto 0);
		C : IN std_logic_vector(0 to 0);          
		ALU_RESULT : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	--PC + 1
	COMPONENT ALU_PC_MODULE
	PORT(
		NPC : IN std_logic_vector(31 downto 0);
		STATIC : IN std_logic_vector(31 downto 0);          
		PC : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	--CONTROL UNIT
	COMPONENT CONTROL_UNIT_MODULE
	PORT(
		OP : IN std_logic_vector(1 downto 0);
		OP2 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		OP3 : IN std_logic_vector(5 downto 0);
		ICC : IN std_logic_vector(3 downto 0);
		COND : IN std_logic_vector(3 downto 0);          
		PCSOURCE : OUT std_logic_vector(1 downto 0);
		ALUOP : OUT std_logic_vector(5 downto 0);
		WRDENMEM : OUT std_logic;
		RFSOURCE : OUT std_logic_vector(1 downto 0);
		RFDEST : OUT std_logic;
		WE : OUT std_logic
		);
	END COMPONENT;
	--DATA MEMORY
	COMPONENT DATA_MEMORY_MODULE
	PORT(
		RST : IN std_logic;
		CLK : IN STD_LOGIC;
		ALU_RESULT : IN std_logic_vector(4 downto 0);
		cRD : IN std_logic_vector(31 downto 0);
		WRDENMEM : IN std_logic;          
		DATATOMEM : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	--IM
	COMPONENT INSTRUCTION_MEMORY_MODULE
	PORT(
		PC : IN std_logic_vector(5 downto 0);
		RST : IN std_logic;          
		INSTRUCTION : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	-- MUX BRANCHS
	COMPONENT MUX_BR_MODULE
	PORT(
		PCSOURCE : IN std_logic_vector(1 downto 0);
		CALL : IN std_logic_vector(31 downto 0);
		BRANCHS : IN std_logic_vector(31 downto 0);
		PC : IN std_logic_vector(31 downto 0);
		ALU_RESULT : IN std_logic_vector(31 downto 0);          
		DATATONPC : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	-- MUX RESULT
	COMPONENT MUX_DM_MODULE
	PORT(
		RFSOURCE : IN std_logic_vector(1 downto 0);
		DATATOMEM : IN std_logic_vector(31 downto 0);
		ALU_RESULT : IN std_logic_vector(31 downto 0);
		PC : IN std_logic_vector(31 downto 0);          
		DATATOREG : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	-- MUX CRS1 OR IMM
	COMPONENT MUX_RF_MODULE
	PORT(
		I : IN std_logic;
		CRS2 : IN std_logic_vector(31 downto 0);
		SIMM : IN std_logic_vector(31 downto 0);          
		OP2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	-- MUX RD OR 15
	COMPONENT MUX_WM_MODULE
	PORT(
		RFDEST : IN std_logic;
		RD : IN std_logic_vector(5 downto 0);          
		NRD : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;
	-- PSR MODIFIER
	COMPONENT PSR_MODIFIER_MODULE
	PORT(
		CRS1 : IN std_logic_vector(31 downto 0);
		OP2 : IN std_logic_vector(31 downto 0);
		ALUOP : IN std_logic_vector(5 downto 0);
		ALU_RESULT : IN std_logic_vector(31 downto 0);          
		NZVC : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	-- PSR
	COMPONENT PSR_MODULE
	PORT(
		CLK : IN std_logic;
		NZVC : IN std_logic_vector(3 downto 0);
		RST : IN std_logic;
		NCWP : IN std_logic_vector(0 to 0);          
		ICC : OUT std_logic_vector(3 downto 0);
		CWP : OUT std_logic_vector(0 to 0);
		C : OUT std_logic_vector(0 to 0)
		);
	END COMPONENT;
	-- REGISTER FILE
	COMPONENT REGITER_FILE_MODULE
	PORT(
		NRS1 : IN std_logic_vector(5 downto 0);
		NRS2 : IN std_logic_vector(5 downto 0);
		NRD : IN std_logic_vector(5 downto 0);
		RST : IN std_logic;
		WE : IN std_logic;
		DATATOREG : IN std_logic_vector(31 downto 0);          
		CRS1 : OUT std_logic_vector(31 downto 0);
		CRD : OUT std_logic_vector(31 downto 0);
		CRS2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	-- SEU DISP22
	COMPONENT SEU_BR_MODULE
	PORT(
		DISP22 : IN std_logic_vector(21 downto 0);          
		SDISP22 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	-- SEU DISP30
	COMPONENT SEU_CALL_MODULE
	PORT(
		DISP30 : IN std_logic_vector(29 downto 0);          
		SDISP30 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	-- SEU IMM
	COMPONENT SEU_IMM_MODULE
	PORT(
		IMM : IN std_logic_vector(12 downto 0);          
		SIMM : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	-- WINDOWS MANAGER
	COMPONENT WINDOWS_MANAGER_MODULE
	PORT(
		CWP : IN std_logic_vector(0 to 0);
		OP : IN std_logic_vector(1 downto 0);
		OP3 : IN std_logic_vector(5 downto 0);
		RS1 : IN std_logic_vector(4 downto 0);
		RS2 : IN std_logic_vector(4 downto 0);
		RD : IN std_logic_vector(4 downto 0);          
		NCWP : OUT std_logic_vector(0 to 0);
		NRS1 : OUT std_logic_vector(5 downto 0);
		NRS2 : OUT std_logic_vector(5 downto 0);
		NRD : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;
	
	SIGNAL AUX_NPC : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL AUX_DATATONPC: STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL AUX_PC_FETCH : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL AUX_PC_DECODE : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL AUX_PC_EXECUTE : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL AUX_PC_MEMORY : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL AUX_PC_RESULT : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL AUX_PC_PLUS_ONE_FETCH: STD_LOGIC_VECTOR(31 DOWNTO 0) := X"00000000";
	SIGNAL AUX_INSTRUCTION_FETCH: STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL AUX_INSTRUCTION_DECODE: STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL AUX_SDISP22_FETCH: STD_LOGIC_VECTOR(31 DOWNTO 0) ;
	SIGNAL AUX_SDISP22_DECODE: STD_LOGIC_VECTOR(31 DOWNTO 0) ;
	SIGNAL AUX_SDISP30_FETCH: STD_LOGIC_VECTOR(31 DOWNTO 0) ;
	SIGNAL AUX_SDISP30_DECODE: STD_LOGIC_VECTOR(31 DOWNTO 0) ;
	SIGNAL AUX_BRANCHS: STD_LOGIC_VECTOR(31 DOWNTO 0) := X"00000000";
	SIGNAL AUX_CALL: STD_LOGIC_VECTOR(31 DOWNTO 0) := X"00000000";
	SIGNAL AUX_ALUOP_DECODE: STD_LOGIC_VECTOR(5 DOWNTO 0);
	SIGNAL AUX_ALUOP_EXECUTE: STD_LOGIC_VECTOR(5 DOWNTO 0);
	SIGNAL AUX_CWP_FETCH:STD_LOGIC_VECTOR(0 DOWNTO 0);
	SIGNAL AUX_CWP_DECODE:STD_LOGIC_VECTOR(0 DOWNTO 0);
	SIGNAL AUX_CWP_EXECUTE:STD_LOGIC_VECTOR(0 DOWNTO 0);
	SIGNAL AUX_CWP_MEMORY:STD_LOGIC_VECTOR(0 DOWNTO 0);
	SIGNAL AUX_CWP_RESULT:STD_LOGIC_VECTOR(0 DOWNTO 0);
	SIGNAL AUX_NCWP_DECODE:STD_LOGIC_VECTOR(0 DOWNTO 0);
	SIGNAL AUX_NCWP_EXECUTE:STD_LOGIC_VECTOR(0 DOWNTO 0);
	SIGNAL AUX_NRS1:STD_LOGIC_VECTOR(5 DOWNTO 0);
	SIGNAL AUX_NRS2:STD_LOGIC_VECTOR(5 DOWNTO 0);
	SIGNAL AUX_NRD:STD_LOGIC_VECTOR(5 DOWNTO 0);
	SIGNAL AUX_RD:STD_LOGIC_VECTOR(5 DOWNTO 0);
	SIGNAL AUX_CRS1_DECODE:STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL AUX_CRS1_EXECUTE:STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL AUX_CRS2:STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL AUX_CRD_DECODE:STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL AUX_CRD_EXECUTE:STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL AUX_CRD_MEMORY:STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL AUX_SIMM:STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL AUX_OP2_DECODE:STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL AUX_OP2_EXECUTE:STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL AUX_C:STD_LOGIC_VECTOR(0 DOWNTO 0);
	SIGNAL AUX_ALU_RESULT_EXECUTE:STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL AUX_ALU_RESULT_MEMORY:STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL AUX_ALU_RESULT_RESULT:STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL AUX_NZVC:STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL AUX_ICC_FETCH:STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL AUX_ICC_DECODE:STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL AUX_ICC_EXECUTE:STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL AUX_ICC_MEMORY:STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL AUX_ICC_RESULT:STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL AUX_PCSOURCE_DECODE:STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL AUX_PCSOURCE_EXECUTE:STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL AUX_WRDENMEM_DECODE:STD_LOGIC;
	SIGNAL AUX_WRDENMEM_EXECUTE:STD_LOGIC;
	SIGNAL AUX_WRDENMEM_MEMORY:STD_LOGIC;
	SIGNAL AUX_RFSOURCE_DECODE:STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL AUX_RFSOURCE_EXECUTE:STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL AUX_RFSOURCE_MEMORY:STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL AUX_RFSOURCE_RESULT:STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL AUX_RFDEST_FETCH:STD_LOGIC;
	SIGNAL AUX_RFDEST_DECODE:STD_LOGIC;
	SIGNAL AUX_RFDEST_DECODE_TWO:STD_LOGIC;
	SIGNAL AUX_RFDEST_EXECUTE:STD_LOGIC;
	SIGNAL AUX_RFDEST_MEMORY:STD_LOGIC;
	SIGNAL AUX_RFDEST_RESULT:STD_LOGIC;
	SIGNAL AUX_WE_FETCH:STD_LOGIC;
	SIGNAL AUX_WE_DECODE:STD_LOGIC;
	SIGNAL AUX_WE_DECODE_TWO:STD_LOGIC;
	SIGNAL AUX_WE_EXECUTE:STD_LOGIC;
	SIGNAL AUX_WE_MEMORY:STD_LOGIC;
	SIGNAL AUX_WE_RESULT:STD_LOGIC;
	SIGNAL AUX_DATATOMEM_MEMORY:STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL AUX_DATATOMEM_RESULT:STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL AUX_DATATOREG_FETCH:STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL AUX_DATATOREG_DECODE:STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL AUX_DATATOREG_RESULT:STD_LOGIC_VECTOR(31 DOWNTO 0);
	
BEGIN
	Inst_PIPE_FETCH: PIPE_FETCH PORT MAP(
		CLK => CLK,
		RST => RST,
		PC_IN => AUX_PC_FETCH,
		SDISP22_IN => AUX_SDISP22_FETCH,
		SDISP30_IN => AUX_SDISP30_FETCH,
		INSTRUCTION_IN => AUX_INSTRUCTION_FETCH,
		RFDEST_IN => AUX_RFDEST_FETCH,
		WE_IN => AUX_WE_FETCH,
		CWP_IN => AUX_CWP_FETCH,
		ICC_IN => AUX_ICC_FETCH,
		DATATOREG_IN => AUX_DATATOREG_FETCH,
		PC_OUT => AUX_PC_DECODE,
		SDISP22_OUT => AUX_SDISP22_DECODE,
		SDISP30_OUT => AUX_SDISP30_DECODE,
		INSTRUCTION_OUT => AUX_INSTRUCTION_DECODE,
		RFDEST_OUT => AUX_RFDEST_DECODE,
		WE_OUT => AUX_WE_DECODE,
		CWP_OUT => AUX_CWP_DECODE,
		ICC_OUT => AUX_ICC_DECODE,
		DATATOREG_OUT => AUX_DATATOREG_DECODE
	);
	Inst_PIPE_DECODE: PIPE_DECODE PORT MAP(
		CLK => CLK,
		RST => RST,
		PC_IN => AUX_PC_DECODE,
		PCSOURCE_IN => AUX_PCSOURCE_DECODE,
		ALUOP_IN => AUX_ALUOP_DECODE,
		WRDENMEM_IN => AUX_WRDENMEM_DECODE,
		RFSOURCE_IN => AUX_RFSOURCE_DECODE,
		RFDEST_IN => AUX_RFDEST_DECODE_TWO,
		WE_IN => AUX_WE_DECODE_TWO,
		CRS1_IN => AUX_CRS1_DECODE,
		CRD_IN => AUX_CRD_DECODE,
		OP2_IN => AUX_OP2_DECODE,
		NCWP_IN => AUX_NCWP_DECODE,
		PC_OUT => AUX_PC_EXECUTE,
		PCSOURCE_OUT => AUX_PCSOURCE_EXECUTE,
		ALUOP_OUT => AUX_ALUOP_EXECUTE,
		WRDENMEM_OUT => AUX_WRDENMEM_EXECUTE,
		RFSOURCE_OUT => AUX_RFSOURCE_EXECUTE,
		RFDEST_OUT => AUX_RFDEST_EXECUTE,
		WE_OUT => AUX_WE_EXECUTE,
		CRS1_OUT => AUX_CRS1_EXECUTE,
		CRD_OUT => AUX_CRD_EXECUTE,
		OP2_OUT => AUX_OP2_EXECUTE,
		NCWP_OUT => AUX_NCWP_EXECUTE
	);
	Inst_PIPE_EXECUTE: PIPE_EXECUTE PORT MAP(
		CLK => CLK,
		RST => RST,
		ALURESULT_IN => AUX_ALU_RESULT_EXECUTE,
		ICC_IN => AUX_ICC_EXECUTE,
		CWP_IN => AUX_CWP_EXECUTE,
		WRDENMEM_IN => AUX_WRDENMEM_EXECUTE,
		RFDEST_IN => AUX_RFDEST_EXECUTE,
		WE_IN => AUX_WE_EXECUTE,
		RFSOURCE_IN => AUX_RFSOURCE_EXECUTE,
		PC_IN => AUX_PC_EXECUTE,
		CRD_IN => AUX_CRD_EXECUTE,
		ALURESULT_OUT => AUX_ALU_RESULT_MEMORY,
		ICC_OUT => AUX_ICC_MEMORY,
		CWP_OUT => AUX_CWP_MEMORY,
		WRDENMEM_OUT => AUX_WRDENMEM_MEMORY,
		RFDEST_OUT => AUX_RFDEST_MEMORY,
		WE_OUT => AUX_WE_MEMORY,
		RFSOURCE_OUT => AUX_RFSOURCE_MEMORY,
		PC_OUT => AUX_PC_MEMORY,
		CRD_OUT => AUX_CRD_MEMORY
	);
	Inst_PIPE_MEMORY: PIPE_MEMORY PORT MAP(
		CLK => CLK,
		RST => RST,
		ALURESULT_IN => AUX_ALU_RESULT_MEMORY,
		RFSOURCE_IN => AUX_RFSOURCE_MEMORY,
		DATATOMEM_IN => AUX_DATATOMEM_MEMORY,
		PC_IN => AUX_PC_MEMORY,
		ICC_IN => AUX_ICC_MEMORY,
		CWP_IN => AUX_CWP_MEMORY,
		RFDEST_IN => AUX_RFDEST_MEMORY,
		WE_IN => AUX_WE_MEMORY,
		ALURESULT_OUT => AUX_ALU_RESULT_RESULT,
		RFSOURCE_OUT => AUX_RFSOURCE_RESULT,
		DATATOMEM_OUT => AUX_DATATOMEM_RESULT,
		PC_OUT => AUX_PC_RESULT,
		ICC_OUT => AUX_ICC_RESULT,
		CWP_OUT => AUX_CWP_RESULT,
		RFDEST_OUT => AUX_RFDEST_RESULT,
		WE_OUT => AUX_WE_RESULT
	);
	Inst_PIPE_RESULT: PIPE_RESULT PORT MAP(
		CLK => CLK,
		RST => RST,
		DATATOREG_IN => AUX_DATATOREG_RESULT,
		ICC_IN => AUX_ICC_RESULT,
		CWP_IN => AUX_CWP_RESULT,
		WE_IN => AUX_WE_RESULT,
		RFDEST_IN => AUX_RFDEST_RESULT,
		DATATOREG_OUT => AUX_DATATOREG_FETCH,
		ICC_OUT => AUX_ICC_FETCH,
		CWP_OUT => AUX_CWP_FETCH,
		WE_OUT => AUX_WE_FETCH,
		RFDEST_OUT => AUX_RFDEST_FETCH
	);
	Inst_NPC_MODULE: PC_MODULE PORT MAP(
		PC => AUX_NPC,
		CLK => CLK,
		RST => RST,
		INSTR => AUX_DATATONPC
	);
	
	Inst_PC_MODULE: PC_MODULE PORT MAP(
		PC => AUX_PC_FETCH,
		CLK => CLK,
		RST => RST,
		INSTR => AUX_NPC 
	);
	
	Inst_ALU_BR_MODULE: ALU_BR_MODULE PORT MAP(
		SDISP22 => AUX_SDISP22_DECODE,
		PC => AUX_PC_DECODE,
		BRANCHS => AUX_BRANCHS
	);
	
	Inst_ALU_CALL_MODULE: ALU_CALL_MODULE PORT MAP(
		SDISP30 => AUX_SDISP30_DECODE,
		PC => AUX_PC_DECODE,
		CALL => AUX_CALL
	);
	
	Inst_ALU_MODULE: ALU_MODULE PORT MAP(
		ALUOP => AUX_ALUOP_EXECUTE,
		CRS1 => AUX_CRS1_EXECUTE,
		OP2 => AUX_OP2_EXECUTE,
		C => AUX_C,
		ALU_RESULT => AUX_ALU_RESULT_EXECUTE
	);
	Inst_ALU_PC_MODULE: ALU_PC_MODULE PORT MAP(
		NPC => AUX_NPC,
		STATIC => X"00000001",
		PC => AUX_PC_PLUS_ONE_FETCH 
	);
	Inst_CONTROL_UNIT_MODULE: CONTROL_UNIT_MODULE PORT MAP(
		OP => AUX_INSTRUCTION_DECODE(31 DOWNTO 30),
		OP2 => AUX_INSTRUCTION_DECODE (24 DOWNTO 22),
		OP3 => AUX_INSTRUCTION_DECODE(24 DOWNTO 19),
		ICC => AUX_ICC_DECODE,
		COND => AUX_INSTRUCTION_DECODE(28 DOWNTO 25),
		PCSOURCE => AUX_PCSOURCE_DECODE,
		ALUOP => AUX_ALUOP_DECODE,
		WRDENMEM => AUX_WRDENMEM_DECODE,
		RFSOURCE => AUX_RFSOURCE_DECODE,
		RFDEST => AUX_RFDEST_DECODE_TWO,
		WE => AUX_WE_DECODE_TWO
	);
	Inst_DATA_MEMORY_MODULE: DATA_MEMORY_MODULE PORT MAP(
		RST => RST,
		CLK => CLK,
		ALU_RESULT => AUX_ALU_RESULT_MEMORY(4 DOWNTO 0),
		cRD => AUX_CRD_MEMORY,
		WRDENMEM => AUX_WRDENMEM_MEMORY,
		DATATOMEM => AUX_DATATOMEM_MEMORY
	);
	Inst_INSTRUCTION_MEMORY_MODULE: INSTRUCTION_MEMORY_MODULE PORT MAP(
		PC => AUX_PC_FETCH(5 DOWNTO 0),
		RST => RST,
		INSTRUCTION => AUX_INSTRUCTION_FETCH
	);
	Inst_MUX_BR_MODULE: MUX_BR_MODULE PORT MAP(
		PCSOURCE => AUX_PCSOURCE_DECODE,
		CALL => AUX_CALL,
		BRANCHS => AUX_BRANCHS,
		PC => AUX_PC_PLUS_ONE_FETCH,
		ALU_RESULT => AUX_ALU_RESULT_EXECUTE,
		DATATONPC => AUX_DATATONPC
	);
	Inst_MUX_DM_MODULE: MUX_DM_MODULE PORT MAP(
		RFSOURCE => AUX_RFSOURCE_RESULT,
		DATATOMEM => AUX_DATATOMEM_RESULT,
		ALU_RESULT => AUX_ALU_RESULT_RESULT,
		PC => AUX_PC_RESULT,
		DATATOREG => AUX_DATATOREG_RESULT
	);
	Inst_MUX_RF_MODULE: MUX_RF_MODULE PORT MAP(
		I => AUX_INSTRUCTION_DECODE(13),
		CRS2 => AUX_CRS2,
		SIMM => AUX_SIMM,
		OP2 => AUX_OP2_DECODE
	);
	Inst_MUX_WM_MODULE: MUX_WM_MODULE PORT MAP(
		RFDEST => AUX_RFDEST_DECODE,
		RD => AUX_RD,
		NRD => AUX_NRD
	);
	Inst_PSR_MODIFIER_MODULE: PSR_MODIFIER_MODULE PORT MAP(
		CRS1 => AUX_CRS1_EXECUTE,
		OP2 => AUX_OP2_EXECUTE,
		ALUOP => AUX_ALUOP_EXECUTE,
		ALU_RESULT => AUX_ALU_RESULT_EXECUTE,
		NZVC => AUX_NZVC
	);
	Inst_PSR_MODULE: PSR_MODULE PORT MAP(
		CLK => CLK,
		NZVC => AUX_NZVC,
		RST => RST,
		NCWP => AUX_NCWP_EXECUTE,
		ICC => AUX_ICC_EXECUTE,
		CWP => AUX_CWP_EXECUTE,
		C => AUX_C
	);
	Inst_REGITER_FILE_MODULE: REGITER_FILE_MODULE PORT MAP(
		NRS1 => AUX_NRS1,
		NRS2 => AUX_NRS2,
		NRD => AUX_NRD,
		RST => RST,
		WE => AUX_WE_DECODE,
		DATATOREG => AUX_DATATOREG_DECODE,
		CRS1 => AUX_CRS1_DECODE,
		CRD => AUX_CRD_DECODE,
		CRS2 => AUX_CRS2
	);
	Inst_SEU_BR_MODULE: SEU_BR_MODULE PORT MAP(
		DISP22 => AUX_INSTRUCTION_FETCH(21 DOWNTO 0),
		SDISP22 => AUX_SDISP22_FETCH
	);
	Inst_SEU_CALL_MODULE: SEU_CALL_MODULE PORT MAP(
		DISP30 => AUX_INSTRUCTION_FETCH(29 DOWNTO 0),
		SDISP30 => AUX_SDISP30_FETCH
	);
	Inst_SEU_IMM_MODULE: SEU_IMM_MODULE PORT MAP(
		IMM => AUX_INSTRUCTION_DECODE(12 DOWNTO 0),
		SIMM => AUX_SIMM
	);
	Inst_WINDOWS_MANAGER_MODULE: WINDOWS_MANAGER_MODULE PORT MAP(
		CWP => AUX_CWP_DECODE,
		OP => AUX_INSTRUCTION_DECODE(31 DOWNTO 30),
		OP3 => AUX_INSTRUCTION_DECODE(24 DOWNTO 19),
		RS1 => AUX_INSTRUCTION_DECODE(18 DOWNTO 14),
		RS2 => AUX_INSTRUCTION_DECODE(4 DOWNTO 0),
		RD => AUX_INSTRUCTION_DECODE(29 DOWNTO 25),
		NCWP => AUX_NCWP_DECODE,
		NRS1 => AUX_NRS1,
		NRS2 => AUX_NRS2,
		NRD => AUX_RD
	);
	
	RESULT <= AUX_DATATOREG_FETCH;
	
end Behavioral;

