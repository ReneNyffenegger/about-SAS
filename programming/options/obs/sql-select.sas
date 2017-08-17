/* Limit result set to three records */
options obs=3;

proc sql;
  select * from sashelp.cars;
quit;
