%macro tq84_do_until;

  %local i;
  %let   i = 1;

  %do %until(&i = 10);
      %put i = &i;
      %let i = %eval(&i + 1);
  %end;

%mend  tq84_do_until;

%tq84_do_until
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
