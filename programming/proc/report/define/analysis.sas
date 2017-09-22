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
def jkl uv   3
abc jkl uv   .
ghi jkl wx  96
ghi mno uv  75
abc pqr wx 111
abc jkl uv  86
def pqr yz  39
abc jkl uv  15
ghi jkl wx  22
abc pqr wx   .
ghi mno uv  41
def pqr yz  52
quit;


proc report data=tq84_report;
     column txt1 txt2 txt3
         /* val is used for multiple statistics per
            group. Therefore, we create an alias
            for each statistics: */
            val = val_sum
            val = val_avg
            val = val_min
            val = val_max 
            val = val_cnt;

     define txt1    / group;
     define txt2    / group;
     define txt3    / group;
     define val_sum / analysis sum             'Total';
     define val_avg / analysis mean format=3.1 'Avg.' ;
     define val_min / analysis min             'Min.' ;
     define val_max / analysis max             'Max.' ;
     define val_cnt / analysis n               'Count';
     
run;
