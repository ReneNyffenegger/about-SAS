proc report data=tq84_report;

     where val > 20;

     column txt val val_sq;

     define txt / display;
     define val / display;
     
     compute val_sq;
       val_sq = val ** 2;
     endcomp;
run;
