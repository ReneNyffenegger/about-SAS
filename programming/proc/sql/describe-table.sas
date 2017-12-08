data some_table;
     attrib
       col_one   label = 'foo'
       col_two   label = 'bar' length = $20.
       col_three label = 'baz' length = $10.
     ;
     col_one   =  42;
     col_two   = 'Hello world.';
     col_three = ' ';
run;

proc sql;
  describe table work.some_table;
quit;
/* 
  create table WORK.SOME_TABLE( bufsize=65536 )
     (
      col_one num label='foo',
      col_two char(20) label='bar',
      col_three char(10) label='baz'
     );
*/
