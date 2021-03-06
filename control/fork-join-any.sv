//  Author  :   Admin (www.chipverify.com)
//  Purpose :   Example of a fork -join_any block

module tb;

   initial begin
`ifndef BEGIN_END
      fork
               $display ("[%0t] Statement 1", $time);
         #10   $display ("[%0t] Statement 3", $time);
         #20   $display ("[%0t] Statement 2", $time);
         #5    $display ("[%0t] Statement 4", $time);
      join_any
      $display ("[%0t] Fork-Join finished", $time);

`else
      fork
         begin
                $display ("[%0t] Begin-End block started", $time);
            #20 $display ("[%0t] Begin-End Statement 1", $time);
            #5  $display ("[%0t] Begin-End Statement 2", $time);
         end
         #10   $display ("[%0t] Statement 3", $time);
         #5    $display ("[%0t] Statement 4", $time);
      join_any
      $display ("[%0t] Fork-Join finished", $time);
`endif
   end
endmodule

/* Simulation Log:
------------------
ncsim> run
[0] Statement 1
[0] Fork-Join finished
[5] Statement 4
[10] Statement 3
[20] Statement 2
ncsim: *W,RNQUIE: Simulation is complete.


Simulation Log:  +define+BEGIN_END
----------------------------------
ncsim> run
[0] Begin-End block started
[5] Statement 4
[5] Fork-Join finished
[10] Statement 3
[20] Begin-End Statement 1
[25] Begin-End Statement 2
ncsim: *W,RNQUIE: Simulation is complete.

*/
