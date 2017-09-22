data tq84_report;
  length txt1 $3
         txt2 $3
         txt3 $2
         val   4.;
  input  txt1 txt2 txt3 val;
datalines;
abc jkl uv  13
ghi mno uv 288
ghi pqr wx   7
abc mno yz  15
def pqr uv   3
abc jkl uv   .
ghi jkl wx  96
ghi mno yz  75
abc pqr yz 111
abc jkl uv  86
def pqr uv  39
ghi jkl yz  22
abc pqr wx   .
ghi mno uv  41
def pqr yz  52
quit;


proc report data=tq84_report;
     column txt1 txt2 txt3 val;

     define txt1 / group;
     define txt2 / group;
     define txt3 / group;
     define val  / display;
     
run;
