module conversion_sel_mux (
    input  [1:0]        select_i,

    input  [143:0]      pixel_data_rgb2yuv422_i,
    input               valid_rgb2yuv422_i,

    input  [143:0]      pixel_data_yuv4442yuv422_i,
    input               valid_yuv4442yuv422_i,

    input  [143:0]      pixel_data_i,
    input               valid_i,

    output reg [143:0]  pixel_data_o,
    output reg          valid_o
    );

    always @(*) begin
        pixel_data_o = pixel_data_i;
        valid_o      = valid_i;

        case (select_i)
            2'b00 : begin
                pixel_data_o = pixel_data_yuv4442yuv422_i;
                valid_o      = valid_yuv4442yuv422_i;
            end
            2'b01 : begin
                pixel_data_o = pixel_data_rgb2yuv422_i;
                valid_o      = valid_rgb2yuv422_i;
            end
        endcase
    end

endmodule