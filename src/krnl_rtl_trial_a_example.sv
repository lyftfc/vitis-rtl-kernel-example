// This is a generated file. Use and modify at your own risk.
//////////////////////////////////////////////////////////////////////////////// 
// default_nettype of none prevents implicit wire declaration.
`default_nettype none
module krnl_rtl_trial_a_example #(
  parameter integer C_S_DIN_TDATA_WIDTH  = 64,
  parameter integer C_M_DOUT_TDATA_WIDTH = 64
)
(
  // System Signals
  input  wire                              ap_clk       ,
  input  wire                              ap_rst_n     ,
  // Pipe (AXI4-Stream host) interface s_din
  output wire                              s_din_tvalid ,
  input  wire                              s_din_tready ,
  output wire [C_S_DIN_TDATA_WIDTH-1:0]    s_din_tdata  ,
  output wire [C_S_DIN_TDATA_WIDTH/8-1:0]  s_din_tkeep  ,
  output wire                              s_din_tlast  ,
  // Pipe (AXI4-Stream host) interface m_dout
  input  wire                              m_dout_tvalid,
  output wire                              m_dout_tready,
  input  wire [C_M_DOUT_TDATA_WIDTH-1:0]   m_dout_tdata ,
  input  wire [C_M_DOUT_TDATA_WIDTH/8-1:0] m_dout_tkeep ,
  input  wire                              m_dout_tlast 
);


timeunit 1ps;
timeprecision 1ps;

///////////////////////////////////////////////////////////////////////////////
// Local Parameters
///////////////////////////////////////////////////////////////////////////////
// Large enough for interesting traffic.
localparam integer  LP_DEFAULT_LENGTH_IN_BYTES = 16384;
localparam integer  LP_NUM_EXAMPLES    = 1;

///////////////////////////////////////////////////////////////////////////////
// Wires and Variables
///////////////////////////////////////////////////////////////////////////////
(* KEEP = "yes" *)
logic                                areset                         = 1'b0;
logic [32-1:0]                       ctrl_xfer_size_in_bytes        = LP_DEFAULT_LENGTH_IN_BYTES;
logic [32-1:0]                       ctrl_constant                  = 32'd1;

///////////////////////////////////////////////////////////////////////////////
// Begin RTL
///////////////////////////////////////////////////////////////////////////////

// Register and invert reset signal.
always @(posedge ap_clk) begin
  areset <= ~ap_rst_n;
end

// Vadd stream example
krnl_rtl_trial_a_example_vadd_axis #(
  .C_S_AXIS_TDATA_WIDTH ( C_S_DIN_TDATA_WIDTH        ),
  .C_M_AXIS_TDATA_WIDTH ( C_S_DIN_TDATA_WIDTH        ),
  .C_ADDER_BIT_WIDTH    ( 32                         ),
  .C_NUM_CLOCKS         ( 1                          ),
  .C_GEN_S_AXIS_DATA    ( 0                          ),
  .C_LENGTH_IN_BYTES    ( LP_DEFAULT_LENGTH_IN_BYTES )
)
inst_example_vadd__m_dout_to_s_din (
  .aclk          ( ap_clk        ),
  .areset        ( areset        ),
  .kernel_clk    ( ap_clk        ),
  .kernel_rst    ( areset        ),
  .s_axis_tvalid ( m_dout_tvalid ),
  .s_axis_tready ( m_dout_tready ),
  .s_axis_tdata  ( m_dout_tdata  ),
  .s_axis_tkeep  ( m_dout_tkeep  ),
  .s_axis_tlast  ( m_dout_tlast  ),
  .m_axis_tvalid ( s_din_tvalid  ),
  .m_axis_tready ( s_din_tready  ),
  .m_axis_tdata  ( s_din_tdata   ),
  .m_axis_tkeep  ( s_din_tkeep   ),
  .m_axis_tlast  ( s_din_tlast   ),
  .ctrl_constant ( 32'b1         )
);

endmodule : krnl_rtl_trial_a_example
`default_nettype wire
