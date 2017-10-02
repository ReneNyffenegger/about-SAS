data tq84_dat;

 length txt_one $10
        txt_two $10
        num_one   8.
        num_two   8.;

  input txt_one
        txt_two
        num_one
        num_two;

datalines;
foo abc  2 40 
run;

proc report
     data=tq84_dat
     list;
run;

/*
PROC REPORT DATA=WORK.TQ84_DAT LS=132 PS=60  SPLIT="/" NOCENTER ;
COLUMN  txt_one txt_two num_one num_two;
 
DEFINE  txt_one / DISPLAY FORMAT= $10. WIDTH=10    SPACING=2   LEFT "txt_one" ;
DEFINE  txt_two / DISPLAY FORMAT= $10. WIDTH=10    SPACING=2   LEFT "txt_two" ;
DEFINE  num_one / SUM FORMAT= BEST9. WIDTH=9     SPACING=2   RIGHT "num_one" ;
DEFINE  num_two / SUM FORMAT= BEST9. WIDTH=9     SPACING=2   RIGHT "num_two" ;
RUN;
*/
