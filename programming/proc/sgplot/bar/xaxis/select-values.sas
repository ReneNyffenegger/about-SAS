ods graphics on;


data tq84_distribution;

  call streaminit(2808);

  do obs = 1 to 1000; /* Create 1000 observations */
 
     num = 1;
     do while(1);
        if rand('norm') > 1 then leave;
        num = num+1;
     end;
     
     txt = put(num, words30.);
     
     output;
     
  end;

run;

proc sgplot data = tq84_distribution;
   vbar txt;
        
   xaxis type=discrete values=('one' 'two' 'three' 'four' 'five' 'six' 'seven' 'eight' 'nine' 'ten');

run;
