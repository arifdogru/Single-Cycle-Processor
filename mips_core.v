module mips_core(clock);
	input clock;
	reg [31:0] pc=0;
	wire [31:0] instr;
	wire RegWrite,AluSrc,RegDst,MemtoReg,MemRead,MemWrite,Branch,Jump;
	wire [1:0]Aluop;
	wire [31:0] read_data_1, read_data_2, mux32_result , read_data, pc_add_4, new_pc,end_of_cycle;
	wire [31:0] write_data, signExtend_result, shiftResult,Aluresult;
	wire [4:0]  write_reg, out;
	wire z , v, cout,andRes;
	wire[2:0] Aluctr;
	wire [25:0] inst_for_jump;
	wire [27:0] inst_shifted;
	wire [31:0] shifted_and_pc4,last_PC;
	
	// instruction okunur
	mips_instr_mem  mem(instr, pc/4);

	
	// Control Unite instruction girer sinyaller uretilir
	mips_Main_Control control(instr[31:26],RegWrite,AluSrc,RegDst,MemtoReg,MemRead,MemWrite,Branch,Jump,Aluop);
	
	// 5 bitlik muxla instruction 20-16 veya 15-11 bitleri Control unitten gelen sinyale gore secilir 
	mux_5to1_Bit regMux( instr[20:16], instr[15:11], RegDst, out );
	
	// Register bloguna muxla secilen instruction ve control unitten gelen sinyal girer
	mips_registers registers(read_data_1, read_data_2,write_data, instr[25:21], instr[20:16], out, RegWrite, clock);
	
	// instruction 15 bit sign extend unite gonderilir
	signExtend signExUnit( instr[15:0], signExtend_result);
	
	// instruction 5 bit alu controla gonderilir
	mips_Alu_Control_Block AluControl( instr[5:0], Aluop, Aluctr );
	
	// sign extend'den gelen result shift edilir
	shiftLeft shifter(signExtend_result, shiftResult);
	
	// Sign extend'den gelen result ile register'dan okunan read data 2 mux'da selecte gore secilir
	mux_32Bit mux32( read_data_2, signExtend_result, AluSrc, mux32_result );
	 
	// Aluya Alu control result, read data 1 ve daha once secilen mux'un sonucu girer 
	mips_ALU_32Bit alu32(Aluctr, read_data_1, mux32_result, Aluresult, z, v,cout);
	
	// Memory bloguna gecilir
	mips_data_mem memory(read_data, Aluresult, read_data_2, MemRead, MemWrite);
	
	// Memory'den cikan sonuc ile Alu'dan cikan sonuctan birinin secilmesi icin muxa gonderilir
	mux_32Bit mux_memory( Aluresult, read_data, MemtoReg ,write_data);

	and( andRes, z, Branch );
	
	assign pc_add_4 = pc + 4;
	
	assign new_pc = pc_add_4 + shiftResult;
	
	mux_32Bit mux33(  pc_add_4,new_pc, andRes, end_of_cycle );
	
	// Jump icin eklemeler
	assign inst_for_jump = instr[25:0]; 
	assign inst_shifted = inst_for_jump << 2;
	assign shifted_and_pc4[27:0] = inst_shifted;
	assign shifted_and_pc4[31:28] = pc_add_4[31:28];
	
	mux_32Bit j_mux(end_of_cycle,shifted_and_pc4,Jump,last_PC);
	
	always @(posedge clock)
	begin
	
	$display("Time:%2d, clk:%1b,\n--Sinyaller--\nregWrite:%1b, AluSrc:%1b, RegDst:%1b, MemtoReg:%1b, MemRead:%1b, MemWrite:%1b, Branch:%1b, Jump:%1b,\n------------\nProgram Counter:%32b,\nDegisen Program Counter:%32b,\Toplanan Program Counter %32b,\nIslemdeki instruction:%32b\nALU_input1:%32b, ALU_input2:%32b\nresult:%32b  ALUControl:%3b, Carry_Out:%1b, Z:%1b, V:%1b\n",
          $time,clock,RegWrite, AluSrc, RegDst, MemtoReg, MemRead, MemWrite, Branch,Jump,pc,last_PC,pc_add_4, instr, read_data_1, mux32_result, Aluresult, Aluctr,cout, z, v);
	
	pc <= last_PC;
	end
	
endmodule