data tq84_dat;
     do i = 1 to 10;
        output;
     end;
run;


proc report
     nowindows
     data = tq84_dat;

     columns i running_total;

     define i             / display;
     define running_total / computed;

     compute before;
       cum_tot = 0;
     endcomp;

     compute running_total;
          cum_tot = cum_tot + i;
          running_total = cum_tot;
     endcomp;
run;
