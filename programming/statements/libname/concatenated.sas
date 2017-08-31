
libname tq84_d1 'p:\ath\to\directory\one';
libname tq84_d2 'p:\ath\to\directory\two';
libname tq84_d3 'p:\ath\to\directory\three';

%macro create_tab(lib_no,nam);
  create table tq84_d&lib_no..&nam(
    col_1 numeric,
    col_2 char(10)
  );
  insert into tq84_d&lib_no..&nam values(&lib_no,"&nam");
%mend;

proc sql;
   %create_tab(1,foo);
   %create_tab(2,bar);
   %create_tab(3,baz);
quit;

/*
    Create a concatenated library (tq84_all). With this library, it is possible
    to access tables in different libraries (and locations) with a single libref.
*/

libname tq84_all (
  tq84_d1,
  tq84_d2,
  tq84_d3
);

proc sql;
  /*
      The following view is created in the 
      tq84_d1 library.
  
  */
  create view tq84_all.foo_bar_baz as
    select * from tq84_all.foo union all
    select * from tq84_all.bar union all
    select * from tq84_all.baz;
quit;

proc sql;
  select * from tq84_all.foo_bar_baz;
quit;
