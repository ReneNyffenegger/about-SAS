data tq84_data;

  length num     8
         en   $ 10
         gr   $ 10
         fr   $ 10;

  input  num en gr fr;

datalines;
1 one   eins un
2 two   zwei deux
3 three drei trois
4 four  vier quattre
5 five  fünf cinque
run;

proc sql;

  create table tq84_long_col_names(
    rename=(en=english
            fr=french
            gr=german)
  )
  as
  select *
  from   tq84_data;

quit;
