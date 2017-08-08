libname tq84_lib 'P:\ath\to\a\directory';

data tq84_lib.dat; /* Creates P:\ath\to\a\directory\dat.sas7bdat */
  infile datalines;
  input
    col_num
    col_txt $20.
  ;

datalines;
1 foo
2 bar
3 baz
;



/* Create view: */
data tq84_lib.vw /view=tq84_lib.vw; /* Creates P:\ath\to\a\directory\vw.sas7bvew */
  set tq84_lib.dat;

  col_num = col_num * 2;
run;

/* Modify view's underlying data set: */
proc sql;
  update tq84_lib.dat
     set col_num = col_num * 10,
         col_txt = catx(',', col_txt, col_txt);
quit;

/* Print changed data in view */
proc print data=tq84_lib.vw;
run;
