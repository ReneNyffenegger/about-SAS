libname tq84_ix 'p:\ath\to\some\directory';

proc datasets
     library=tq84_ix
     kill;
quit;


data tq84_ix.num;
  length num txt $ 10;
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

proc datasets
     library=tq84_ix;
     modify num;

  index create num / unique;
run;

proc sql;
  select
    name    , /* Column name: num    */
    idxusage, /* Index type : SIMPLE */
    indxname, /* Index name : num    */
    unique    /* Unique?    : yes    */
  from
    dictionary.indexes
  where
    libname = 'TQ84_IX' and
    memname = 'NUM';
quit;
