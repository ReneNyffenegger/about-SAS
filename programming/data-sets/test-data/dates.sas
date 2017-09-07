/*
    Is this REALLY the way to read dates
*/
data work.tq84_stage;

  length
    id     8.
    col_1  $20.
    tev_dt 8.;

  informat tev_dt date9.;
  format   tev_dt date9.;

  infile datalines dlm=',';

  input id
        col_1
        tev_dt;
  

datalines;
1,one,01sep17
2,two,02sep17
3,three,03sep17
12,twelve,12sep17
13,thirteen,13sep17
29,twenty-nine,29sep17
;
