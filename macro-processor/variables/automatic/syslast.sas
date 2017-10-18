data;
   txt = 'demonstration of syslast';
run;

%put last dataset created is &syslast;

proc sql;
  select * from &syslast;
quit;
