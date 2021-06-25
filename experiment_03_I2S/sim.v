`timescale 1ns / 1ps

module i2cMtestbench();
  reg clk, rst, enable;
  wire BCLK,LRCLK, SDATA, RightNLeft;
  reg [15:0] rightAudio, leftAudio;
  
  i2sMaster uut(rst,,LRCLK,SDATA,BCLK,rightAudio,leftAudio,enable,RightNLeft);
  bitClkGen clkgen(clk, rst, BCLK);

  always #5 clk = ~clk;

  

  initial
    begin
      $dumpfile("sim.vcd");
      $dumpvars(0, clk);
      $dumpvars(1, rst);
      $dumpvars(2, enable);
      $dumpvars(3, BCLK);
      $dumpvars(4, LRCLK);
      $dumpvars(5, SDATA);
      $dumpvars(6, RightNLeft);
      $dumpvars(7, rightAudio);
      $dumpvars(8, leftAudio);
      #40000
      $finish;
    end

  initial 
    begin
      clk <= 0;
      rst <= 0;
      rightAudio <= 16'b1010_1010_1010_1010;
      leftAudio <= 16'b1111_0000_1111_0000;
      enable <= 1;
      #16
      rst <= 1;
      #16
      rst <= 0;

    end
endmodule//sim