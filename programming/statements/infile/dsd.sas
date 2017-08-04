data tq84_dsd;
  infile datalines dsd;

  length bar $ 50;

  input
    foo
    bar $
    baz $
  ;

datalines;
1,one,I
  5  ,  five , V
 100 , "one hundred and one", C
 104,"one hundred and four"  , CIV
;


proc print data = tq84_dsd;
run;
