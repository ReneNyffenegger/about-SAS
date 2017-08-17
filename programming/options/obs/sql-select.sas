/*
   Limit result set to three records.

   Note: proc sql also has an "outobs=n" option.

*/
options obs=3;

proc sql;
  select * from sashelp.cars;
quit;
