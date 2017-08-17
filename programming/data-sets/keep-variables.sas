data xy;

/* Keep x and y, don't output i and r */
   keep x y;

   do i = 1 to 100;
      r = rand('norm'); 

      x = r ** 2;
      y = x ** 2;
      
      output;
   end;

run;

proc print
     data = xy;
run;
