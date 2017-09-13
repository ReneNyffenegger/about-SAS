data tq84_data;

  infile datalines;

  length col_1 $10
         col_2 $10
         col_3 $10;

  input col_1 col_2 col_3;

datalines;
x y z
one two three
foo bar baz
strawberry blackberry blueberry
;

proc export
     data=tq84_data(keep=col_1 col_3)
     outfile='p:\ath\to\exported.txt';
     putnames=no;
run;
