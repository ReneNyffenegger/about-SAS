data _null_;
  
   opt = getoption('work');
   put 'Value of option work is ' opt;
   
run;
