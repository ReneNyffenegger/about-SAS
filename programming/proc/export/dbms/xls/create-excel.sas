data tq84_xls;
     do num = 1 to 100;
        txt = put(num, words30.);
        output;
     end;
run;

%let xls_file_name=p:\ath\to\excel\file.xls;

proc export
     data    = tq84_xls
     dbms    = xls
     outfile ="&xls_file_name";

     sheet="all";
run;


proc export
/*   Sine &xls_file_name already exists, a *.bak file
     will additionally be created. */ 

     data    = tq84_xls(where=(num <= 10))
     dbms    = xls
     outfile ="&xls_file_name";

     sheet="first ten";
run;
