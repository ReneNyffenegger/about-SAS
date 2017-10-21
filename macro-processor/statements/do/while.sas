%macro tq84_do_while;

  %local i;
  %let   i = 1;

  %do %while(&i < 10);
      %put i = &i;
      %let i = %eval(&i + 1);
  %end;

%mend  tq84_do_while;

%tq84_do_while
/*
i = 1
i = 2
i = 3
i = 4
i = 5
i = 6
i = 7
i = 8
i = 9
*/
