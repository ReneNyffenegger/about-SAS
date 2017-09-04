data tq84_nums_spelled;

/* The words format spells numbers */

  attrib num     format =       8.
         spelled format = words50.;

  do num=0 to 1000;
     spelled = num;
     output;
  end;

run;
