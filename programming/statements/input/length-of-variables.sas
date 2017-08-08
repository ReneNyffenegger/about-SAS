data tq84_s;

  infile datalines;

  length col_1 $25;
  length col_2 $10;
  length col_3 $10;

  input
    col_1
    col_2
    col_3
  ;

datalines;
x y z
one two three
foo bar baz
longerThanEightCharacters strawberry blackberry
;



proc print data=tq84_s;
run;
