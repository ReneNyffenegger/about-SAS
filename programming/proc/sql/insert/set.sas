proc sql;

  create table tq84_tab (
     col_1   char(10),
     col_2   num,
     col_3   char(10)
  );


  insert into tq84_tab
  set
     col_3 = 'three',
     col_2 =  2     ,
     col_1 = 'one'  ;

  select * from tq84_tab;

quit;
