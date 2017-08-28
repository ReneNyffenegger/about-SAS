data tq84_a;
   length txt $20;
   input  val txt;
datalines;
7 seven
9 nine
22 twenty-two
run;

data tq84_b;
   length txt $20;
   input  val txt;
datalines;
2 two
8 eight
13 thirteen
31 thirty-one
42 forty-two
run;

data tq84_a_b_merged;
   set tq84_a tq84_b;
/*
   In order to merge two data sets with "by", the
   two data sets need already to be sorted on the
   variable on which the merge takes place:
*/
   by  val;
run;
