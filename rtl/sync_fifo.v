module sync_fifo #(parameter WIDTH=8, DEPTH=16) (
    input clk, rst, wr_en, rd_en,
    input [WIDTH-1:0] data_in,
    output reg [WIDTH-1:0] data_out,
    output full, empty
);
    reg [WIDTH-1:0] fifo_mem [0:DEPTH-1];
    reg [$clog2(DEPTH):0] wr_ptr, rd_ptr;

    assign full  = (wr_ptr[$clog2(DEPTH)] != rd_ptr[$clog2(DEPTH)]) && 
                   (wr_ptr[$clog2(DEPTH)-1:0] == rd_ptr[$clog2(DEPTH)-1:0]);
    assign empty = (wr_ptr == rd_ptr);

    always @(posedge clk) begin
        if (rst) {wr_ptr, rd_ptr} <= 0;
        else begin
            if (wr_en && !full) begin
                fifo_mem[wr_ptr[$clog2(DEPTH)-1:0]] <= data_in;
                wr_ptr <= wr_ptr + 1;
            end
            if (rd_en && !empty) begin
                data_out <= fifo_mem[rd_ptr[$clog2(DEPTH)-1:0]];
                rd_ptr <= rd_ptr + 1;
            end
        end
    end
endmodule
