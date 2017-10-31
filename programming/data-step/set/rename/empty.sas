data orig;

  foo = 'hello world';
  bar =  42;
  baz =  999;
  
run;

data rename_empty;
  set orig (rename=());
run;

proc sql;
  describe table rename_empty;
quit;
/*
create table WORK.RENAME_EMPTY( bufsize=65536 )
  (
   foo char(11),
   bar num,
   baz num
  );
*/
