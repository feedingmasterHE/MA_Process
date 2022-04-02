/* Generated by Yosys 0.15+38 (git sha1 66914b6eb, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module blink(\blink^clk , \blink^i_reset , \blink^read_mtj , \blink^write_mtj , \blink^o_led );
  wire \0 ;
  wire \blink^ADD~2-0[0] ;
  wire \blink^ADD~2-0~dummy_output~0~1 ;
  wire \blink^ADD~2-1[0] ;
  wire \blink^ADD~2-1[1] ;
  wire \blink^ADD~2-2[0] ;
  wire \blink^ADD~2-2[1] ;
  wire \blink^ADD~2-3[0] ;
  wire \blink^ADD~2-3[1] ;
  wire \blink^ADD~2-4[0] ;
  wire \blink^ADD~2-4[1] ;
  wire \blink^ADD~2-5[0] ;
  wire \blink^ADD~2-5[1] ;
  input \blink^clk ;
  wire \blink^clk ;
  input \blink^i_reset ;
  wire \blink^i_reset ;
  wire \blink^nMUX~0^MUX_2~25 ;
  wire \blink^nMUX~0^MUX_2~26 ;
  wire \blink^nMUX~0^MUX_2~27 ;
  output \blink^o_led ;
  wire \blink^o_led ;
  reg \blink^r_counter~0_FF  = 1'h0;
  reg \blink^r_counter~1_FF  = 1'h0;
  wire \blink^r_counter~2_FF ;
  wire \blink^r_counter~3_FF ;
  wire \blink^r_counter~4_FF ;
  input \blink^read_mtj ;
  wire \blink^read_mtj ;
  input \blink^write_mtj ;
  wire \blink^write_mtj ;
  wire gnd;
  wire n19;
  wire n24;
  wire n29;
  wire n34;
  wire n39;
  wire unconn;
  wire vcc;
  always @(posedge \blink^clk )
    \blink^r_counter~1_FF  <= n39;
  always @(posedge \blink^clk )
    \blink^r_counter~0_FF  <= n19;
  adder _02_ (
    .\a[0] (\blink^r_counter~0_FF ),
    .\b[0] (vcc),
    .\cin[0] (\blink^ADD~2-0[0] ),
    .\cout[0] (\blink^ADD~2-1[0] ),
    .\sumout[0] (\blink^ADD~2-1[1] )
  );
  nonvolatile_ff _03_ (
    .\nonvolatile_ff^clk (\blink^clk ),
    .\nonvolatile_ff^d (\blink^nMUX~0^MUX_2~25 ),
    .\nonvolatile_ff^q (\blink^r_counter~2_FF ),
    .\nonvolatile_ff^read_mtj (\0 ),
    .\nonvolatile_ff^rst (\blink^i_reset ),
    .\nonvolatile_ff^write_mtj (\0 )
  );
  adder _04_ (
    .\a[0] (\blink^r_counter~1_FF ),
    .\b[0] (gnd),
    .\cin[0] (\blink^ADD~2-1[0] ),
    .\cout[0] (\blink^ADD~2-2[0] ),
    .\sumout[0] (\blink^ADD~2-2[1] )
  );
  adder _05_ (
    .\a[0] (\blink^r_counter~2_FF ),
    .\b[0] (gnd),
    .\cin[0] (\blink^ADD~2-2[0] ),
    .\cout[0] (\blink^ADD~2-3[0] ),
    .\sumout[0] (\blink^ADD~2-3[1] )
  );
  adder _06_ (
    .\a[0] (\blink^r_counter~3_FF ),
    .\b[0] (gnd),
    .\cin[0] (\blink^ADD~2-3[0] ),
    .\cout[0] (\blink^ADD~2-4[0] ),
    .\sumout[0] (\blink^ADD~2-4[1] )
  );
  adder _07_ (
    .\a[0] (\blink^r_counter~4_FF ),
    .\b[0] (gnd),
    .\cin[0] (\blink^ADD~2-4[0] ),
    .\cout[0] (\blink^ADD~2-5[0] ),
    .\sumout[0] (\blink^ADD~2-5[1] )
  );
  adder _08_ (
    .\a[0] (vcc),
    .\b[0] (gnd),
    .\cin[0] (unconn),
    .\cout[0] (\blink^ADD~2-0[0] ),
    .\sumout[0] (\blink^ADD~2-0~dummy_output~0~1 )
  );
  nonvolatile_ff _09_ (
    .\nonvolatile_ff^clk (\blink^clk ),
    .\nonvolatile_ff^d (\blink^nMUX~0^MUX_2~27 ),
    .\nonvolatile_ff^q (\blink^r_counter~4_FF ),
    .\nonvolatile_ff^read_mtj (\0 ),
    .\nonvolatile_ff^rst (\blink^i_reset ),
    .\nonvolatile_ff^write_mtj (\0 )
  );
  nonvolatile_ff _10_ (
    .\nonvolatile_ff^clk (\blink^clk ),
    .\nonvolatile_ff^d (\blink^nMUX~0^MUX_2~26 ),
    .\nonvolatile_ff^q (\blink^r_counter~3_FF ),
    .\nonvolatile_ff^read_mtj (\0 ),
    .\nonvolatile_ff^rst (\blink^i_reset ),
    .\nonvolatile_ff^write_mtj (\0 )
  );
  assign n19 = 4'h4 >> { \blink^ADD~2-1[1] , \blink^i_reset  };
  assign n24 = 4'h4 >> { \blink^ADD~2-5[1] , \blink^i_reset  };
  assign n29 = 4'h4 >> { \blink^ADD~2-4[1] , \blink^i_reset  };
  assign n34 = 4'h4 >> { \blink^ADD~2-3[1] , \blink^i_reset  };
  assign n39 = 4'h4 >> { \blink^ADD~2-2[1] , \blink^i_reset  };
  assign \blink^o_led  = 2'h1 >> \blink^r_counter~4_FF ;
  assign vcc = 1'h1;
  assign gnd = 1'h0;
  assign unconn = 1'h0;
endmodule
