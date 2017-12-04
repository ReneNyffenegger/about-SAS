/*
     Reading instream data lines
     
     Apparently, datalines is also a reserved fileref for 
     the INFILE statement.
     
*/

data tq84;
  input num english $ german $;
datalines;
1 one eins
4 four vier
2 two zwei
9 nine neun
;;;;
