module DecoupledGcd(
  input         clock,
  input         reset,
  output        input_ready,
  input         input_valid,
  input  [15:0] input_bits_value1,
  input  [15:0] input_bits_value2,
  input         output_ready,
  output        output_valid,
  output [15:0] output_bits_value1,
  output [15:0] output_bits_value2,
  output [15:0] output_bits_gcd
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
`endif // RANDOMIZE_REG_INIT
  reg [15:0] xInitial; // @[DecoupledGCD.scala 30:24]
  reg [15:0] yInitial; // @[DecoupledGCD.scala 31:24]
  reg [15:0] x; // @[DecoupledGCD.scala 32:24]
  reg [15:0] y; // @[DecoupledGCD.scala 33:24]
  reg  busy; // @[DecoupledGCD.scala 34:28]
  reg  resultValid; // @[DecoupledGCD.scala 35:28]
  wire [15:0] _x_T_1 = x - y; // @[DecoupledGCD.scala 43:14]
  wire [15:0] _y_T_1 = y - x; // @[DecoupledGCD.scala 45:14]
  wire  _T_1 = x == 16'h0; // @[DecoupledGCD.scala 47:12]
  wire  _GEN_10 = input_valid | ~busy; // @[DecoupledGCD.scala 64:23 Decoupled.scala 81:20 DecoupledGCD.scala 37:15]
  wire  _GEN_15 = input_valid | busy; // @[DecoupledGCD.scala 64:23 70:12 34:28]
  assign input_ready = busy ? ~busy : _GEN_10; // @[DecoupledGCD.scala 37:15 41:15]
  assign output_valid = resultValid; // @[DecoupledGCD.scala 38:16]
  assign output_bits_value1 = xInitial; // @[DecoupledGCD.scala 47:34 54:26]
  assign output_bits_value2 = yInitial; // @[DecoupledGCD.scala 47:34 55:26]
  assign output_bits_gcd = _T_1 ? y : x; // @[DecoupledGCD.scala 48:23 49:25 51:25]
  always @(posedge clock) begin
    if (!(busy)) begin // @[DecoupledGCD.scala 41:15]
      if (input_valid) begin // @[DecoupledGCD.scala 64:23]
        xInitial <= input_bits_value1; // @[DecoupledGCD.scala 68:16]
      end
    end
    if (!(busy)) begin // @[DecoupledGCD.scala 41:15]
      if (input_valid) begin // @[DecoupledGCD.scala 64:23]
        yInitial <= input_bits_value2; // @[DecoupledGCD.scala 69:16]
      end
    end
    if (busy) begin // @[DecoupledGCD.scala 41:15]
      if (x > y) begin // @[DecoupledGCD.scala 42:17]
        x <= _x_T_1; // @[DecoupledGCD.scala 43:9]
      end
    end else if (input_valid) begin // @[DecoupledGCD.scala 64:23]
      x <= input_bits_value1; // @[DecoupledGCD.scala 66:9]
    end
    if (busy) begin // @[DecoupledGCD.scala 41:15]
      if (!(x > y)) begin // @[DecoupledGCD.scala 42:17]
        y <= _y_T_1; // @[DecoupledGCD.scala 45:9]
      end
    end else if (input_valid) begin // @[DecoupledGCD.scala 64:23]
      y <= input_bits_value2; // @[DecoupledGCD.scala 67:9]
    end
    if (reset) begin // @[DecoupledGCD.scala 34:28]
      busy <= 1'h0; // @[DecoupledGCD.scala 34:28]
    end else if (busy) begin // @[DecoupledGCD.scala 41:15]
      if (x == 16'h0 | y == 16'h0) begin // @[DecoupledGCD.scala 47:34]
        if (output_ready & resultValid) begin // @[DecoupledGCD.scala 58:41]
          busy <= 1'h0; // @[DecoupledGCD.scala 59:14]
        end
      end
    end else begin
      busy <= _GEN_15;
    end
    if (reset) begin // @[DecoupledGCD.scala 35:28]
      resultValid <= 1'h0; // @[DecoupledGCD.scala 35:28]
    end else if (busy) begin // @[DecoupledGCD.scala 41:15]
      if (x == 16'h0 | y == 16'h0) begin // @[DecoupledGCD.scala 47:34]
        if (output_ready & resultValid) begin // @[DecoupledGCD.scala 58:41]
          resultValid <= 1'h0; // @[DecoupledGCD.scala 60:21]
        end else begin
          resultValid <= 1'h1; // @[DecoupledGCD.scala 56:19]
        end
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  xInitial = _RAND_0[15:0];
  _RAND_1 = {1{`RANDOM}};
  yInitial = _RAND_1[15:0];
  _RAND_2 = {1{`RANDOM}};
  x = _RAND_2[15:0];
  _RAND_3 = {1{`RANDOM}};
  y = _RAND_3[15:0];
  _RAND_4 = {1{`RANDOM}};
  busy = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  resultValid = _RAND_5[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
