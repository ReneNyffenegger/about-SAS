%macro tq84_yyyymm;

  %do yyyy=2015 %to 2017;
  %do m   =   1 %to   12;

      %let mm=%sysfunc(putn(&m, z2.));

      %put &yyyy&mm;

  %end; %end;
  
%mend tq84_yyyymm;
