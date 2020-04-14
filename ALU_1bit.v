/***************************************************
Student Name:HSU-YU-LUN
Student ID: 0716235
***************************************************/
`timescale 1ns/1ps

module ALU_1bit(
	input				src1,       //1 bit source 1  (input)
	input				src2,       //1 bit source 2  (input)
	input 				Ainvert,    //1 bit A_invert  (input)
	input				Binvert,    //1 bit B_invert  (input)
	input 				Cin,        //1 bit carry in  (input)
	input 	    [2-1:0] operation,  //2 bit operation (input)
	output reg          result,     //1 bit result    (output)
	output reg          cout        //1 bit carry out (output)
	);
    reg a,b;
    
always @(*) begin
	result = 1'b0;	
	cout = 1'b0;
	a = src1^Ainvert;
	b = src2^Binvert;
	if(operation==2'b00)begin //and  nor
		result = a&b;
	end
	if(operation==2'b01)begin //or nand
		result = a|b;
	end
	if(operation==2'b10)begin //addition subtraction
	   	result = a^b^Cin; 
	  	cout = a*b+Cin*(a^b);
	end
	if(operation==2'b11)begin //set less than 
		result = a^b^Cin;
		cout = a*b+Cin*(a^b);
	end
end

endmodule
