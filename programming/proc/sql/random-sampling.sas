data tq84_data;

  length num     8
         txt  $ 10;

  input  num txt;

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
run;

proc sql outobs=5;

  select
    num,
    txt
  from
    tq84_data
  order by
    ranuni(280870);

quit;
