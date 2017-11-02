
data tq84_source;

  length
     def  8.
     abc  $5
     lmn  8.
     ijk  $5;

  def = 1; abc = 'abc'; lmn = 11; ijk = 'ijk'; output;
  def = 2; abc = 'ABC'; lmn = 22; ijk = 'IJK'; output;

run;



data tq84_new_column_prepended;

/* By mentioning the newly added column before
   the set statement, the column gets prepended
   in the created dataset. */

   length added $5;
   set tq84_source;

   added = 'added';

run;

proc sql;
  describe table tq84_new_column_prepended;
quit;
/*
create table WORK.TQ84_NEW_COLUMN_PREPENDED( bufsize=65536 )
  (
   added char(5),
   def num,
   abc char(5),
   lmn num,
   ijk char(5)
  );
*/ 



data tq84_new_column_appended;

   set tq84_source;
/* By mentioning the newly added column
   after the set statement, the column
   get added after the already existing
   ones. */

   attrib added length=8. format=date.; 

   added = def;

run;

proc sql;
  describe table tq84_new_column_appended;
quit;
/*
create table WORK.TQ84_NEW_COLUMN_APPENDED( bufsize=65536 )
  (
   def num,
   abc char(5),
   lmn num,
   ijk char(5),
   added num format=DATE.
  );
*/
