libname tq84_dir 'c:\path\to\dir\';

data tq84_dat;

  length spelled $20;

  input
    val
    spelled $
  ;

datalines;
1 one
2 two
3 three
4 four
5 five
42 forty-two
;


proc sql;

  /* Creates file c:\path\to\dir\dat.sas7bdat */
  create table tq84_dir.dat 
  /*  (compress = yes) */
  as
    select
      val,
      spelled
    from
      work.tq84_dat;
  
quit;
