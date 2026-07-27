module YUV444_to_YUV422 (
    input               clk_i,
    input               resetn_i,
    input      [143:0]  pixel_data_i,
    input               data_valid_i,

    output reg [47:0]   Y_data_o,
    output reg [47:0]   C_data_o,
    output reg          data_valid_o
);

    // Cb samples
    wire [11:0] cb0 = pixel_data_i[59:48];
    wire [11:0] cb2 = pixel_data_i[83:72];

    // Cr samples
    wire [11:0] cr0 = pixel_data_i[11:0];
    wire [11:0] cr2 = pixel_data_i[35:24];


    always @(posedge clk_i or negedge resetn_i) begin
        if (!resetn_i) begin
            Y_data_o     <= 48'd0;
            C_data_o     <= 48'd0;
            data_valid_o <= 1'b0;
        end
        else begin
            data_valid_o <= data_valid_i;

            if (data_valid_i) begin

                // Luma is unchanged
                Y_data_o <= pixel_data_i[143:96];

                // 4:2:2 chroma:
                // Pair0 -> Cb0, Cr0
                // Pair1 -> Cb2, Cr2
                C_data_o <= {cr2, cb2, cr0, cb0};

            end
        end
    end

endmodule