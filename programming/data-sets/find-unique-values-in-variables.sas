data tq84_data;

  length num    8
         en  $ 10
         fr  $ 10
         gr  $ 10;

  input  num en fr gr;

datalines;
1 one    un     eins
2 two    deux   zwei
3 three  trois  drei
4 four   .      vier
5 five   cinque fünf
6 six    .      .
7 seven  .      sieben
8 eight  huit   .
9 nine   neuf   neun
10 ten   dix    zehn
run;


%let lib=WORK;
%let tab=TQ84_DATA;

proc sql noprint;
   select
     catx(' ', "count(*) - count(distinct ", name,") as ", name)
   into
     :cols separated by ','
   from
     sashelp.vcolumn
   where
     libname="&lib" and
     memname="&tab";
quit;

%put &cols;


proc sql noprint;
  create table
    cnt_dist_&tab
  as
  select
    &cols
  from
    &lib..&tab;
quit;


proc sql;
  select * from cnt_dist_&tab;
quit;


proc transpose
     data=cnt_dist_&tab
     out=unique_&tab;
run;


proc sql;
  select
    catt(_name_, ' is ', ifc(col1 eq 0, '', ' not'), ' unique')
  from
    unique_&tab;
quit;
