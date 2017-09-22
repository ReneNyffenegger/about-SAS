data tq84_data;
  length num_1 4.
         num_2 4.
         txt   $3;

  input num_1 num_2 txt;

datalines;
13 2 abc
7 913 def
25 40 ghi
873 51 jkl
79 13 mno
645 316 pqr
100 100 stu
run;

proc sql;
  select
    num_1 / num_2        as ratio,
    1 / calculated ratio as ratio_inv,
    txt
  from
    tq84_data
  where
    calculated ratio > 1;
quit;
