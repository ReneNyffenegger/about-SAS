proc format;
  picture
     ddmmyyyy_hh24miss 
    (default=19)                   /* <-- default width of format */
     other='%0d.%0m.%Y %0H:%0M:%0S'
    (datatype=datetime);
  
run;

data _null_;
  dt='9mar2018 7:2:25'dt;
  put dt ddmmyyyy_hh24miss.; /* 09.03.2018 07:02:25 */
run;
