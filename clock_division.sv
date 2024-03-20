//SV Topics : Methods
//Problem statement : to divide the frequency of clock by 2 using task and printing value using a function

//======================================

module test;
  bit clock;
  bit clock2;
  
  always begin
    #5 clock = ~clock;   //creating a clock with time period of 10
    dis(clock, "clock");	//for printing
  end
  
  task clk;
    @(posedge clock);	//wait for posedge of clock
    #0;
  endtask
  
	initial begin
      clock = 0;			//initializing with zero
      clock2 = 0;
      #100;
      $stop;
	end
  
  initial begin
    
      forever begin
        clk;						//this clock2 is inverted at every posedge of clock
        clock2 = ~clock2;
        dis(clock2, "clock2");		//for printing the value
      end
  end
  
  function dis(bit a, string s);
    $display($time, " %s %b", s, a);//printing the value of clock
  endfunction
endmodule
