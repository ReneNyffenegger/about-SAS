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


data tq84_c;
  set tq84_s;

  length concatenated $54;

  concatenated = catx(' - ', col_1, col_2, col_3);
run;


proc print data=tq84_c;
run;
