-- megafunction wizard: %LPM_CONSTANT%
-- GENERATION: STANDARD
-- VERSION: WM1.0
-- MODULE: LPM_CONSTANT 

-- ============================================================
-- File Name: constant1.vhd
-- Megafunction Name(s):
-- 			LPM_CONSTANT
--
-- Simulation Library Files(s):
-- 			lpm
-- ============================================================
-- ************************************************************
-- THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
--
-- 18.1.0 Build 625 09/12/2018 SJ Lite Edition
-- ************************************************************


--Copyright (C) 2018  Intel Corporation. All rights reserved.
--Your use of Intel Corporation's design tools, logic functions 
--and other software and tools, and its AMPP partner logic 
--functions, and any output files from any of the foregoing 
--(including device programming or simulation files), and any 
--associated documentation or information are expressly subject 
--to the terms and conditions of the Intel Program License 
--Subscription Agreement, the Intel Quartus Prime License Agreement,
--the Intel FPGA IP License Agreement, or other applicable license
--agreement, including, without limitation, that your use is for
--the sole purpose of programming logic devices manufactured by
--Intel and sold by Intel or its authorized distributors.  Please
--refer to the applicable agreement for further details.


LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY lpm;
USE lpm.all;

ENTITY constant1 IS
	PORT
	(
		result		: OUT STD_LOGIC_VECTOR (0 DOWNTO 0)
	);
END constant1;


ARCHITECTURE SYN OF constant1 IS

	SIGNAL sub_wire0	: STD_LOGIC_VECTOR (0 DOWNTO 0);



	COMPONENT lpm_constant
	GENERIC (
		lpm_cvalue		: NATURAL;
		lpm_hint		: STRING;
		lpm_type		: STRING;
		lpm_width		: NATURAL
	);
	PORT (
			result	: OUT STD_LOGIC_VECTOR (0 DOWNTO 0)
	);
	END COMPONENT;

BEGIN
	result    <= sub_wire0(0 DOWNTO 0);

	LPM_CONSTANT_component : LPM_CONSTANT
	GENERIC MAP (
		lpm_cvalue => 1,
		lpm_hint => "ENABLE_RUNTIME_MOD=NO",
		lpm_type => "LPM_CONSTANT",
		lpm_width => 1
	)
	PORT MAP (
		result => sub_wire0
	);



END SYN;

-- ============================================================
-- CNX file retrieval info
-- ============================================================
-- Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "MAX 10"
-- Retrieval info: PRIVATE: JTAG_ENABLED NUMERIC "0"
-- Retrieval info: PRIVATE: JTAG_ID STRING "NONE"
-- Retrieval info: PRIVATE: Radix NUMERIC "10"
-- Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
-- Retrieval info: PRIVATE: Value NUMERIC "1"
-- Retrieval info: PRIVATE: nBit NUMERIC "1"
-- Retrieval info: PRIVATE: new_diagram STRING "1"
-- Retrieval info: LIBRARY: lpm lpm.lpm_components.all
-- Retrieval info: CONSTANT: LPM_CVALUE NUMERIC "1"
-- Retrieval info: CONSTANT: LPM_HINT STRING "ENABLE_RUNTIME_MOD=NO"
-- Retrieval info: CONSTANT: LPM_TYPE STRING "LPM_CONSTANT"
-- Retrieval info: CONSTANT: LPM_WIDTH NUMERIC "1"
-- Retrieval info: USED_PORT: result 0 0 1 0 OUTPUT NODEFVAL "result[0..0]"
-- Retrieval info: CONNECT: result 0 0 1 0 @result 0 0 1 0
-- Retrieval info: GEN_FILE: TYPE_NORMAL constant1.vhd TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL constant1.inc TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL constant1.cmp TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL constant1.bsf TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL constant1_inst.vhd TRUE
-- Retrieval info: LIB_FILE: lpm
