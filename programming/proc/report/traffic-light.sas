data tq84_data;
  input
    @1  col_1    $ 9.
    @10 col_2      8.
  ;
datalines;
abc       62
vwx       13 
abc       11
opqrstu   33
defg      13
defg      26
hi         8
opqrstu   63
hi        55
opqrstu   28
jklmn      4
jklmn      9
hi        18
jklmn      5
vwx       27
run;

proc format;
 /*  Create a foreground and background
     color for the report: */
     value colorFG
             0 -   80 = 'white'           
            80 -  100 = 'black'
           100 - high = 'white';

     value colorBG
             0 -   80 = 'green'
            80 -  100 = 'yellow'
           100 - high = 'red'  ;

run;           

%let tq84_ods_out_path   = 'p:\ath\to\dest\dir';
%let tq84_html_body_name = Performance.html; 

ods listing close;
ods html    style = default
            path  = "&tq84_ods_out_path"
            body  = "&tq84_html_body_name";

proc report
     data = tq84_data
     nowd;

     column col_1 col_2;

     define col_1   / group;
     define col_2   / analysis sum
                     'Sum'
                      style(column) = {background = colorBG.
                                       foreground = colorFG.};
run;

ods html close;
