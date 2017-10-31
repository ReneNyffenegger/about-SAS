data orig;
  col_1 = 'hello';
  col_2 =  42;
  col_3 = 'world';
run;

data changed;
     set orig (
         rename=(
            col_1 = col_one
            col_3 = col_three
         )
     );
run;

proc sql;
  describe table changed;
quit;
/*
create table WORK.CHANGED( bufsize=65536 )
  (
   col_one char(5),
   col_2 num,
   col_three char(5)
  );
*/
