proc fcmp outlib=work.funcs.tq84;
  
  subroutine tq84_sub(txt$, num);
    put "txt = " txt;
    put "num = " num;
  endsub;
  
run;

options cmplib=work.funcs;

data _null_;
  call tq84_sub('foo', 42);
run;

%sysfunc(tq84_sub(bar, 99));
