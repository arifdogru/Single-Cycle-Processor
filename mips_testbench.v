module mips_testbench ();

reg clock;

  mips_core test(clock);

  initial begin
    clock=1;

//    $monitor("MipsCoreTest Time:%2d, inst:%32b, pc:%32b",$time, instruction, pc);
    #220 $finish;
  end

  always begin
    #10;
    clock=~clock;
   // $display("MipsCoreTest Time:%2d, inst:%32b, pc:%32b",$time, instruction, pc);
  end


endmodule