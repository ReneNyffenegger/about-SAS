/* Use "global" option obs instead of outobs */
options obs=3;

proc sql;
  select * from sashelp.cars;
quit;
