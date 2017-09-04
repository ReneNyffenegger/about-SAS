/* Create the dataset */
data tq84_ds;
  length num   8.
         txt $20.
  ;
  input  num
         txt
  ;
datalines;
1 one
20 twenty
8 eight
99 ninety-nine
35 thirty-five
run;

/* Write the dataset to a file: */
data _null_;
  file 'p:\ath\to\a\directory\ds.txt';
  set tq84_ds;
  put num txt;
run;
