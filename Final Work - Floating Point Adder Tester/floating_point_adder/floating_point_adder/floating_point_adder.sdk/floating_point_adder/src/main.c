/*
 * @file:    main.c
 * @date:    05/12/2023
 * @author:  Francesco Cavina <francescocavina98@gmail.com>
 * @version: v1.0.0
 *
 * @brief:   This is the source code for a processing system to test the floating point adder IP core.
 */


/* --- Headers files inclusions ----------------------------------------------------------------------------------------------- */
#include <stdio.h>
#include "xil_printf.h"
#include "xparameters.h"
#include "xuartps.h"
#include "floating_point_adder_ip.h"

/* --- Macros definitions ----------------------------------------------------------------------------------------------------- */
#define UART_DEVICE_ID 					XPAR_XUARTPS_0_DEVICE_ID
#define FLOATING_POINT_ADDER_BASEADDR 	XPAR_FLOATING_POINT_ADDER_S_AXI_BASEADDR
#define FLOATING_POINT_ADDER_IP_REG0	FLOATING_POINT_ADDER_IP_S_AXI_SLV_REG0_OFFSET
#define FLOATING_POINT_ADDER_IP_REG1	FLOATING_POINT_ADDER_IP_S_AXI_SLV_REG1_OFFSET
#define FLOATING_POINT_ADDER_IP_REG2	FLOATING_POINT_ADDER_IP_S_AXI_SLV_REG2_OFFSET
#define FLOATING_POINT_ADDER_IP_REG3	FLOATING_POINT_ADDER_IP_S_AXI_SLV_REG3_OFFSET
#define FLOATING_POINT_ADDER_IP_REG4	FLOATING_POINT_ADDER_IP_S_AXI_SLV_REG4_OFFSET
#define FLOATING_POINT_ADDER_INIT_1		(0x00000001)
#define FLOATING_POINT_ADDER_INIT_0		(0x00000000)


/* --- Main function implementation ----------------------------------------------------------------------------------------- */
int main() {

	int numA, numB, res = 0;
	int Status;
	u8 byte_received;
	XUartPs Uart_Ps;
	XUartPs_Config *Config;

	Config = XUartPs_LookupConfig(UART_DEVICE_ID);
	Status = XUartPs_CfgInitialize(&Uart_Ps, Config, Config->BaseAddress);

	xil_printf("Testing Floating Point Adder...\n\n\n\r");



	xil_printf("(Press a key to start...)\r");
	byte_received = XUartPs_RecvByte(Config->BaseAddress);



	/* ----- TEST CASE #01 ---------------------------------------------------------------------------------------------------- */
	numA = 0x3FAC28F6;
	numB = 0x40200000;

	/* Write input registers */
	FLOATING_POINT_ADDER_IP_mWriteReg(FLOATING_POINT_ADDER_BASEADDR, FLOATING_POINT_ADDER_IP_REG0, numA);
	FLOATING_POINT_ADDER_IP_mWriteReg(FLOATING_POINT_ADDER_BASEADDR, FLOATING_POINT_ADDER_IP_REG1, numB);
	FLOATING_POINT_ADDER_IP_mWriteReg(FLOATING_POINT_ADDER_BASEADDR, FLOATING_POINT_ADDER_IP_REG2, FLOATING_POINT_ADDER_INIT_1);
	/* Wait until operation has finished */
	while(0 == FLOATING_POINT_ADDER_IP_mReadReg(FLOATING_POINT_ADDER_BASEADDR, FLOATING_POINT_ADDER_IP_REG4));
	/* Deactivate INIT input */
	FLOATING_POINT_ADDER_IP_mWriteReg(FLOATING_POINT_ADDER_BASEADDR, FLOATING_POINT_ADDER_IP_REG2, FLOATING_POINT_ADDER_INIT_0);
	/* Read output register */
	res = FLOATING_POINT_ADDER_IP_mReadReg(FLOATING_POINT_ADDER_BASEADDR, FLOATING_POINT_ADDER_IP_REG3);

	xil_printf("*********************************************\n\r");
	xil_printf("*               TEST CASE #01               *\n\r");
	xil_printf("*********************************************\n\n\r");
	xil_printf("NUMBER A        =         +1.345 = 0x3FAC28F6\n\r");
	xil_printf("NUMBER B        =         +2.500 = 0x40200000\n\r");
	xil_printf("EXPECTED RESULT =         +3.845 = 0x4076147B\n\r");
	xil_printf("REAL RESULT     =                = 0x%x\n\n\n\r", res);



	/* ----- TEST CASE #02 ---------------------------------------------------------------------------------------------------- */
	numA = 0x4045FA44;
	numB = 0x41473333;

	/* Write input registers */
	FLOATING_POINT_ADDER_IP_mWriteReg(FLOATING_POINT_ADDER_BASEADDR, FLOATING_POINT_ADDER_IP_REG0, numA);
	FLOATING_POINT_ADDER_IP_mWriteReg(FLOATING_POINT_ADDER_BASEADDR, FLOATING_POINT_ADDER_IP_REG1, numB);
	FLOATING_POINT_ADDER_IP_mWriteReg(FLOATING_POINT_ADDER_BASEADDR, FLOATING_POINT_ADDER_IP_REG2, FLOATING_POINT_ADDER_INIT_1);
	/* Wait until operation has finished */
	while(0 == FLOATING_POINT_ADDER_IP_mReadReg(FLOATING_POINT_ADDER_BASEADDR, FLOATING_POINT_ADDER_IP_REG4));
	/* Deactivate INIT input */
	FLOATING_POINT_ADDER_IP_mWriteReg(FLOATING_POINT_ADDER_BASEADDR, FLOATING_POINT_ADDER_IP_REG2, FLOATING_POINT_ADDER_INIT_0);
	/* Read output register */
	res = FLOATING_POINT_ADDER_IP_mReadReg(FLOATING_POINT_ADDER_BASEADDR, FLOATING_POINT_ADDER_IP_REG3);

	xil_printf("*********************************************\n\r");
	xil_printf("*               TEST CASE #02               *\n\r");
	xil_printf("*********************************************\n\n\r");
	xil_printf("NUMBER A        =       + 3.0934 = 0x4045FA44\n\r");
	xil_printf("NUMBER B        =       +12.4500 = 0x41473333\n\r");
	xil_printf("EXPECTED RESULT =       +15.5434 = 0x4178B1C4\n\r");
	xil_printf("REAL RESULT     =                = 0x%x\n\n\n\r", res);



	/* ----- TEST CASE #03 ---------------------------------------------------------------------------------------------------- */
	numA = 0x44A78782;
	numB = 0x4377FFBE;

	/* Write input registers */
	FLOATING_POINT_ADDER_IP_mWriteReg(FLOATING_POINT_ADDER_BASEADDR, FLOATING_POINT_ADDER_IP_REG0, numA);
	FLOATING_POINT_ADDER_IP_mWriteReg(FLOATING_POINT_ADDER_BASEADDR, FLOATING_POINT_ADDER_IP_REG1, numB);
	FLOATING_POINT_ADDER_IP_mWriteReg(FLOATING_POINT_ADDER_BASEADDR, FLOATING_POINT_ADDER_IP_REG2, FLOATING_POINT_ADDER_INIT_1);
	/* Wait until operation has finished */
	while(0 == FLOATING_POINT_ADDER_IP_mReadReg(FLOATING_POINT_ADDER_BASEADDR, FLOATING_POINT_ADDER_IP_REG4));
	/* Deactivate INIT input */
	FLOATING_POINT_ADDER_IP_mWriteReg(FLOATING_POINT_ADDER_BASEADDR, FLOATING_POINT_ADDER_IP_REG2, FLOATING_POINT_ADDER_INIT_0);
	/* Read output register */
	res = FLOATING_POINT_ADDER_IP_mReadReg(FLOATING_POINT_ADDER_BASEADDR, FLOATING_POINT_ADDER_IP_REG3);

	xil_printf("*********************************************\n\r");
	xil_printf("*               TEST CASE #03               *\n\r");
	xil_printf("*********************************************\n\n\r");
	xil_printf("NUMBER A        = +1,340.2346190 = 0x44A78782\n\r");
	xil_printf("NUMBER B        = +  247.9989929 = 0x4377FFBE\n\r");
	xil_printf("EXPECTED RESULT = +1,588.2336119 = 0x44C6877A\n\r");
	xil_printf("REAL RESULT     =                = 0x%x\n\n\n\r", res);



	/* ----- TEST CASE #04 ---------------------------------------------------------------------------------------------------- */
	numA = 0x41090625;
	numB = 0xC03F2B02;

	/* Write input registers */
	FLOATING_POINT_ADDER_IP_mWriteReg(FLOATING_POINT_ADDER_BASEADDR, FLOATING_POINT_ADDER_IP_REG0, numA);
	FLOATING_POINT_ADDER_IP_mWriteReg(FLOATING_POINT_ADDER_BASEADDR, FLOATING_POINT_ADDER_IP_REG1, numB);
	FLOATING_POINT_ADDER_IP_mWriteReg(FLOATING_POINT_ADDER_BASEADDR, FLOATING_POINT_ADDER_IP_REG2, FLOATING_POINT_ADDER_INIT_1);
	/* Wait until operation has finished */
	while(0 == FLOATING_POINT_ADDER_IP_mReadReg(FLOATING_POINT_ADDER_BASEADDR, FLOATING_POINT_ADDER_IP_REG4));
	/* Deactivate INIT input */
	FLOATING_POINT_ADDER_IP_mWriteReg(FLOATING_POINT_ADDER_BASEADDR, FLOATING_POINT_ADDER_IP_REG2, FLOATING_POINT_ADDER_INIT_0);
	/* Read output register */
	res = FLOATING_POINT_ADDER_IP_mReadReg(FLOATING_POINT_ADDER_BASEADDR, FLOATING_POINT_ADDER_IP_REG3);

	xil_printf("*********************************************\n\r");
	xil_printf("*               TEST CASE #04               *\n\r");
	xil_printf("*********************************************\n\n\r");
	xil_printf("NUMBER A        =         +8.564 = 0x41090625\n\r");
	xil_printf("NUMBER B        =         -2.987 = 0xC03F2B02\n\r");
	xil_printf("EXPECTED RESULT =         +5.577 = 0x40B276C9\n\r");
	xil_printf("REAL RESULT     =                = 0x%x\n\n\n\r", res);



	return 0;
}

/* --- End of file ------------------------------------------------------------------------------------------------------------ */
