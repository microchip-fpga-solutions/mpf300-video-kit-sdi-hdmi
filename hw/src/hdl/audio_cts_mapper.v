///////////////////////////////////////////////////////////////////////////////////////////////////
// Company: <Name>
//
// File: audio_cts_mapper.v
// File history:
//      <Revision number>: <Date>: <Comments>
//      <Revision number>: <Date>: <Comments>
//      <Revision number>: <Date>: <Comments>
//
// Description: 
//
// <Description here>
//
// Targeted device: <Family::PolarFire> <Die::MPF300T> <Package::FCG1152>
// Author: <Name>
//
/////////////////////////////////////////////////////////////////////////////////////////////////// 

//`timescale <time_units> / <precision>

module audio_cts_mapper( FRACTIONAL_FRAME_RATE_I,FRAME_RATE_60FPS_30FPS_I,VIDEO_CODE_I ,CTS_O );
input FRACTIONAL_FRAME_RATE_I,FRAME_RATE_60FPS_30FPS_I;
input [7:0] VIDEO_CODE_I ;
output reg [19:0] CTS_O;



localparam VIC_BW                               = 8;

localparam [VIC_BW-1 : 0] VIC_3840x2160p60      = 97;
localparam [VIC_BW-1 : 0] VIC_3840x2160p50      = 96;
localparam [VIC_BW-1 : 0] VIC_3840x2160p30      = 95;
localparam [VIC_BW-1 : 0] VIC_3840x2160p25      = 94;
localparam [VIC_BW-1 : 0] VIC_3840x2160p24      = 93;
localparam [VIC_BW-1 : 0] VIC_1920x1080p60      = 16;
localparam [VIC_BW-1 : 0] VIC_1920x1080p50      = 31;
localparam [VIC_BW-1 : 0] VIC_1920x1080p30      = 34;
localparam [VIC_BW-1 : 0] VIC_1920x1080p25      = 33;
localparam [VIC_BW-1 : 0] VIC_1920x1080i60      = 5;
localparam [VIC_BW-1 : 0] VIC_1920x1080i50      = 20;
localparam [VIC_BW-1 : 0] VIC_1280x720p60       = 4;
localparam [VIC_BW-1 : 0] VIC_1280x720p50       = 19;
localparam [VIC_BW-1 : 0] VIC_1280x720p30       = 62;
localparam [VIC_BW-1 : 0] VIC_270M_625I         = 25;
localparam [VIC_BW-1 : 0] VIC_270M_525I         = 10;





always@(*)
begin
case ({FRACTIONAL_FRAME_RATE_I,VIDEO_CODE_I})
{1'b0,VIC_3840x2160p60} : CTS_O = 20'h91050 ;    //4k60 fps
{1'b0,VIC_3840x2160p50} : CTS_O = 20'h91050 ;    //4k50 fps
{1'b1,VIC_3840x2160p60} : CTS_O = 20'h90E00 ;    //4k59.94
{1'b0,VIC_3840x2160p30} : CTS_O = 20'h48828 ;    //4k30 fps
{1'b0,VIC_3840x2160p25} : CTS_O = 20'h48828 ;    //4k25 fps
{1'b0,VIC_3840x2160p24} : CTS_O = 20'h48828 ;    //4k24 fps
{1'b1,VIC_3840x2160p30} : CTS_O = 20'h48700 ;    //4k29.97 fps
{1'b1,VIC_3840x2160p24} : CTS_O = 20'h48700 ;    //4k23.98 fps
{1'b0,VIC_1920x1080p60} : CTS_O = 20'h24414 ;    //FHD60fps
{1'b0,VIC_1920x1080p50} : CTS_O = 20'h24414 ;    //FHD50fps
{1'b1,VIC_1920x1080p60} : CTS_O = 20'h24220 ;    //FHD59.94 fps
{1'b0,VIC_1920x1080p30} : CTS_O = 20'h1220A ;    //FHD30fps
{1'b0,VIC_1920x1080p25} : CTS_O = 20'h1220A ;    //FHD25fps
{1'b1,VIC_1920x1080p30} : CTS_O = 20'h12110 ;    //FHD29.97 fps
{1'b0,VIC_1280x720p60}  : CTS_O = 20'h1220A ;    //720p60fps
{1'b0,VIC_1280x720p50}  : CTS_O = 20'h1220A ;    //720p50fps
{1'b0,VIC_1280x720p30}  : CTS_O = 20'h1220A ;    //720p30fps
{1'b1,VIC_1280x720p30}  : CTS_O = 20'h12110 ;    //720p29.97 fps
{1'b0,VIC_270M_625I} : CTS_O = 20'h0D2F0;   // SD 625i 50Hz (27.000 MHz)
{1'b1,VIC_270M_625I} : CTS_O = 20'h0D2F0;   // SD 625i 50Hz (27.000 MHz)
{1'b0,VIC_270M_525I} : CTS_O = 20'h0D2BA;   // SD 525i 59.94Hz (27.027 MHz)
{1'b1,VIC_270M_525I} : CTS_O = 20'h0D2BA;   // SD 525i 59.94Hz (27.027 MHz)
default : CTS_O = 20'h91050;   //60/50fps

endcase 


end 


endmodule

