data tq84_numbers_1_to_10;
  length num 4. txt $20;

  do num = 1 to 10;
     txt = put(num, words20.);
     output;
  end;
run;

ods listing close;
ods html
    body     = 'tq84_body.html'
    contents = 'tq84_contents.html'
    page     = 'tq84_page.html'
    frame    = 'tq84_frame.html'
 /* 
    path: destination for created files.
           Use url=none in order to not have absolute paths
           within links in the created html files. */
    path     = "&tq84_ods_test_linux_dest_path" (url=none)
;

ods proclabel 'Just the data';
proc print data = tq84_numbers_1_to_10;
     title "Numbers from one to ten!";
quit;

ods proclabel 'Selecting odd numbers with proc sql';
proc sql;
     title "Odd numbers.";

     select * from tq84_numbers_1_to_10
     where
       mod(num, 2) = 1;
quit;

ods html close;
ods listing;
