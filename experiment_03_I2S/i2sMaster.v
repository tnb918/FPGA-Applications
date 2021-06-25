module i2sMaster#(parameter DATASIZE = 16)(
  input rst,
  //I2S signals
  output BCLK_o, //SCK
  output reg LRCLK, //WS
  output SDATA,
  input BCLK_i, //SCK
  //Data interface
  input [DATASIZE-1:0] rightAudio,
  input [DATASIZE-1:0] leftAudio,
  input enable,
  output reg RightNLeft);
  //Get counter size
  localparam COUNTERSIZE = $clog2(DATASIZE);
  //Current channel
  localparam LEFT = 1'b0, RIGHT = 1'b1;
  //Data buffer to transmit
  reg [DATASIZE-1:0] dataBuff;
  //Update data buff
  wire updatePulse;
  //Count transmitted bits
  reg [COUNTERSIZE-1:0] bitCounter;
  wire bitCounterDone;

  wire BCLK;

  //All BCLKs are same
  assign BCLK = BCLK_i & enable;
  assign BCLK_o = BCLK;

  //Data routing signals
  assign SDATA = dataBuff[DATASIZE-1];
  assign updatePulse = LRCLK ^ RightNLeft;
  always@(negedge BCLK)
    begin
      if(updatePulse)
        dataBuff[DATASIZE-1:0] <= (LRCLK == RIGHT) ? rightAudio : leftAudio;
      else
        dataBuff <= dataBuff << 1;
    end
  
  //Handle LRCLK
  always@(negedge BCLK or posedge rst)
    begin
      if(rst)
        begin
          LRCLK <= LEFT;
        end
      else
        begin
          LRCLK <= (bitCounterDone) ? ~RightNLeft : LRCLK;
        end
    end
  
  //Bit counter
  assign bitCounterDone = bitCounter == (DATASIZE-1);
  always @(negedge BCLK or posedge rst) 
    begin
      if(rst)
        bitCounter <= DATASIZE-1;
      else
        bitCounter <= (bitCounterDone) ? {COUNTERSIZE{1'b0}} : (bitCounter + {{COUNTERSIZE-1{1'b0}}, 1'b1});
    end

  //Actuall channel comes one edge after
  always@(negedge BCLK)
    begin
      RightNLeft <= LRCLK;
    end
endmodule


//PERIOD should be desired output clockperiod in ns and CLKPERIOD should be input clock period in ns.
module bitClkGen #(parameter PERIOD = 651, parameter CLKPERIOD = 10)(
  input clk,
  input rst,
  output reg BCLK);
  localparam CYCLESinHALFP = PERIOD / (2 * CLKPERIOD);
  localparam COUNTERSIZE = $clog2(CYCLESinHALFP-1);

  wire countDone;
  reg [COUNTERSIZE-1:0] counter;

  assign countDone = (counter == (CYCLESinHALFP-1));

  always@(posedge clk or posedge rst)
    begin
      if(rst)
        BCLK <= 1'd0;
      else
        BCLK <= (countDone) ? ~BCLK : BCLK;

    end
  

  always@(posedge clk)
    begin
      if(rst)
          counter <= {COUNTERSIZE{1'd0}};
      else
          counter <= (countDone) ? {COUNTERSIZE{1'd0}} : (counter + {{(COUNTERSIZE-1){1'd0}},1'd1});
    end
endmodule//bitClkGen
