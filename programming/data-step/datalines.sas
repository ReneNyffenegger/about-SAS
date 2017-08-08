data abc;
  infile datalines;
  input
    col_num
    col_txt $50.
  ;


datalines;
1 foo
2 bar
3 baz
4 MoreThanEightCharacters
;


data mult_2;
  set abc;
  col_num = col_num * 2;
run;
