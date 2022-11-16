`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:02:05 10/20/2022
// Design Name:   nexys3
// Module Name:   C:/Users/Student/Desktop/10AM_Gang/LAB2/tb.v
// Project Name:  LAB2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: nexys3
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb;

	// Inputs
	reg [11:0] inp;

	// Outputs
	wire [2:0] exp;
	wire [3:0] sgnfd;
	wire sgn;

	// Instantiate the Unit Under Test (UUT)
	fpcvt uut (
		.sgn(sgn),
		.exp(exp), 
		.sgnfd(sgnfd), 
		.inp(inp)
	);

	//nexys3 NEXUS (.inp(inp), .exp(exp), .sgnfd(sgnfd));
	initial begin
		// Initialize INPUTS
		//Test Cases
	
		inp = 12'b111100000000; // 1 leading zero, negative
		#100;
		inp = 12'b010000000000; //2 leading zeros, etc
		#100;
		inp = 12'b000001000010; //6 leading zeros
		#100;
		inp = 12'b000000000011; //11 leading zeroes
		#100;
		
		//edge cases
		inp = 12'b000000000000;
		#100;
		inp = 12'b100000000000; //edge case
		#100
		inp = 12'b011111111111; //max positive number
		#100;

		inp = 12'b000000101100; //pdf test cases
		#100;
		inp = 12'b000000101101; //pdf test cases
		#100;
		inp = 12'b000000101110; //pdf test cases
		#100;
		inp = 12'b000000101111; //pdf test cases
		#100;
		
		


		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		$display ("%d Sign: %08b, Exponent: %08b, Significand: %08b, Input: %08b", 
			$stime, sgn, exp, sgnfd, inp);

	end
      
endmodule

