data xSquared;
  do x=1 to 10;
     y=x ** 2;
     output;
  end;
run;

proc print data=xSquared;
run;
