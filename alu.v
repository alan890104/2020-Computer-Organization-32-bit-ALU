/***************************************************
Student Name:HSU-YU-LUN
Student ID:0716235
***************************************************/
`timescale 1ns/1ps

module alu(
	input                   rst_n,         // negative reset            (input)
	input	     [32-1:0]	src1,          // 32 bits source 1          (input)
	input	     [32-1:0]	src2,          // 32 bits source 2          (input)
	input 	     [ 4-1:0] 	ALU_control,   // 4 bits ALU control input  (input)
	output reg   [32-1:0]	result,        // 32 bits result            (output)
	output reg              zero,          // 1 bit when the output is 0, zero must be set (output)
	output reg              cout,          // 1 bit carry out           (output)
	output reg              overflow       // 1 bit overflow            (output)
	);

reg 	Ainvert;
reg  	Binvert;
wire	out;
reg     [31:0]  a;
reg     [31:0]  b;
wire  	[31:0]  cin;
wire 	[31:0]	results;
reg     [1:0] 	operation;
assign  cin[0] = (ALU_control==4'b0110)? 1: (ALU_control==4'b0111)? 1: 0;

ALU_1bit  alan0(a[0],b[0],Ainvert,Binvert,cin[0],operation,results[0],cin[1]);
ALU_1bit  alan1(a[1],b[1],Ainvert,Binvert,cin[1],operation,results[1],cin[2]);
ALU_1bit  alan2(a[2],b[2],Ainvert,Binvert,cin[2],operation,results[2],cin[3]);
ALU_1bit  alan3(a[3],b[3],Ainvert,Binvert,cin[3],operation,results[3],cin[4]);
ALU_1bit  alan4(a[4],b[4],Ainvert,Binvert,cin[4],operation,results[4],cin[5]);
ALU_1bit  alan5(a[5],b[5],Ainvert,Binvert,cin[5],operation,results[5],cin[6]);
ALU_1bit  alan6(a[6],b[6],Ainvert,Binvert,cin[6],operation,results[6],cin[7]);
ALU_1bit  alan7(a[7],b[7],Ainvert,Binvert,cin[7],operation,results[7],cin[8]);
ALU_1bit  alan8(a[8],b[8],Ainvert,Binvert,cin[8],operation,results[8],cin[9]);
ALU_1bit  alan9(a[9],b[9],Ainvert,Binvert,cin[9],operation,results[9],cin[10]);
ALU_1bit  alan10(a[10],b[10],Ainvert,Binvert,cin[10],operation,results[10],cin[11]);
ALU_1bit  alan11(a[11],b[11],Ainvert,Binvert,cin[11],operation,results[11],cin[12]);
ALU_1bit  alan12(a[12],b[12],Ainvert,Binvert,cin[12],operation,results[12],cin[13]);
ALU_1bit  alan13(a[13],b[13],Ainvert,Binvert,cin[13],operation,results[13],cin[14]);
ALU_1bit  alan14(a[14],b[14],Ainvert,Binvert,cin[14],operation,results[14],cin[15]);
ALU_1bit  alan15(a[15],b[15],Ainvert,Binvert,cin[15],operation,results[15],cin[16]);
ALU_1bit  alan16(a[16],b[16],Ainvert,Binvert,cin[16],operation,results[16],cin[17]);
ALU_1bit  alan17(a[17],b[17],Ainvert,Binvert,cin[17],operation,results[17],cin[18]);
ALU_1bit  alan18(a[18],b[18],Ainvert,Binvert,cin[18],operation,results[18],cin[19]);
ALU_1bit  alan19(a[19],b[19],Ainvert,Binvert,cin[19],operation,results[19],cin[20]);
ALU_1bit  alan20(a[20],b[20],Ainvert,Binvert,cin[20],operation,results[20],cin[21]);
ALU_1bit  alan21(a[21],b[21],Ainvert,Binvert,cin[21],operation,results[21],cin[22]);
ALU_1bit  alan22(a[22],b[22],Ainvert,Binvert,cin[22],operation,results[22],cin[23]);
ALU_1bit  alan23(a[23],b[23],Ainvert,Binvert,cin[23],operation,results[23],cin[24]);
ALU_1bit  alan24(a[24],b[24],Ainvert,Binvert,cin[24],operation,results[24],cin[25]);
ALU_1bit  alan25(a[25],b[25],Ainvert,Binvert,cin[25],operation,results[25],cin[26]);
ALU_1bit  alan26(a[26],b[26],Ainvert,Binvert,cin[26],operation,results[26],cin[27]);
ALU_1bit  alan27(a[27],b[27],Ainvert,Binvert,cin[27],operation,results[27],cin[28]);
ALU_1bit  alan28(a[28],b[28],Ainvert,Binvert,cin[28],operation,results[28],cin[29]);
ALU_1bit  alan29(a[29],b[29],Ainvert,Binvert,cin[29],operation,results[29],cin[30]);
ALU_1bit  alan30(a[30],b[30],Ainvert,Binvert,cin[30],operation,results[30],cin[31]);
ALU_1bit  alan31(a[31],b[31],Ainvert,Binvert,cin[31],operation,results[31],out);

always @(*)begin
	if(rst_n)begin
		result = 0;
		cout =0;
		overflow =0; 
		zero = 0;
	end
	Ainvert = ALU_control[3];
	Binvert = ALU_control[2];
	operation ={ ALU_control[1],ALU_control[0]};
	a = src1;
   	b = src2;
  	cout = (ALU_control==4'b0111) ? 1'b0 : out;
   	overflow = out^cin[31];
    	result = (ALU_control==4'b0111) ?(results[31]==1? 1:0): results;
    	zero = (result==0);
end


endmodule
