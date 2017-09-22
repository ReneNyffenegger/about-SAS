data tq84_data;
  length num   4.
         txt  $3;

  input  num txt;

datalines;
18 foo
13 bar
5 foo
19 baz
22 baz
8 foo
5 bar
18 foo
13 bar
run;

proc sql;
  select
    sum(num),
    txt      
  into
  /* We know there are three records, so upper bound
     can be specified */
    :sum_1 - :sum_3,
    :txt_1 - :txt_3
  from
    tq84_data
  group by
    txt;

  %put &=txt_1 &=sum_1;
  %put &=txt_2 &=sum_2;
  %put &=txt_3 &=sum_3;
quit;


proc sql;
  select
    num,
    txt
  into
  /* We don't know number of selected rows. So,
     we specify an "open" upper bound: */
    :num1-,
    :txt1-
  from
    tq84_data;

quit;

%macro showSQLResult;
/* This macro iterates over the selected records.
   It uses the sqlobs automatic macro variable
   which was set in the select statement. */
   %do obs=1 %to &sqlobs;
       %put Observation &obs - &&txt&obs | &&num&obs;
   %end;
%mend;

%showSQLResult;
