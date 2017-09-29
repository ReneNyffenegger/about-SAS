data tq84_data;

  infile datalines;

  length num   8
         txt  $20
  ;

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
;
run;

proc export

     data=tq84_data (where=(txt gt 'm'))
     outfile='p:\ath\to\exported.txt'
     
     replace;
     putnames=no;
     
run;
