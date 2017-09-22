data tq84_data;
  length num   4.
         txt $20;

  input num txt;

datalines;
1 one
2 two
3 three
4 four
5 five
6 six
7 seven
8 eight
9 nine
10 ten
11 eleven
12 twelve
13 thirteen
run;

proc sql;
  select
    *
  from
    tq84_data
  where
    txt contains 've';
quit;

proc sql;
  select
    *
  from
    tq84_data
  where
    txt ? 'ee';
quit;
