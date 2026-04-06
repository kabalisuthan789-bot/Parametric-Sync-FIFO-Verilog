module tb_fifo;
  reg clk, rst, wr_en, rd_en;
  reg [7:0] data_in;
  wire [7:0] data_out;
  wire full, empty;

  // Instantiate the FIFO
  sync_fifo #(8, 8) dut (clk, rst, wr_en, rd_en, data_in, data_out, full, empty);

  // Clock Generation
  always #5 clk = ~clk;

  initial begin
    // Setup for Waveform Viewing
    $dumpfile("dump.vcd"); $dumpvars(1);
    
    // Initialize
    clk = 0; rst = 1; wr_en = 0; rd_en = 0; data_in = 0;
    #20 rst = 0;

    // Task: Write data until Full
    repeat(8) begin
      @(posedge clk);
      wr_en = 1; data_in = $random;
    end
    @(posedge clk) wr_en = 0;

    // Task: Read data until Empty
    repeat(8) begin
      @(posedge clk);
      rd_en = 1;
    end
    @(posedge clk) rd_en = 0;

    #50 $finish;
  end
endmodule
