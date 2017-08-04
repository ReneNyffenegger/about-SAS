/*

  Use delimiter option of infile to read data that is
  separated by commas rather than by blanks.

*/

data tq84_ts; 
  infile datalines delimiter=',';
  input      x y;
  z = x+y;
datalines;
1,5
4,9
3,0
2,5
;
