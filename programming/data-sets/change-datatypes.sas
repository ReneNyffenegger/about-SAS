/*
   After an idea outlined in
     https://blogs.sas.com/content/sgf/2017/03/28/changing-variable-type-and-variable-length-in-sas-datasets/

*/
data tq84_data;
   col_1 = 'foo bar baz';
   col_2 = '28aug17'd;
   col_3 = '17nov17 17:17:17'dt;
   col_4 = '1:23't;
   col_5 =  42.18;
   col_6 = '01.02.2003';
run;

proc sql;
   describe table tq84_data;
quit;
/*
create table WORK.TQ84_DATA( bufsize=65536 )
  (
   col_1 char(11),
   col_2 num,
   col_3 num,
   col_4 num,
   col_5 num,
   col_6 char(10)
  );
*/

proc sql noprint;
	select name,
          cats(name, '_'),
          cats(name, '=', cats(name, '_'))
   into  :names        separated by ' ',
         :names_       separated by ' ',
         :names_rename separated by ' '
	from   dictionary.columns
	where  libname = 'WORK' and
          memname = 'TQ84_DATA';
quit;

%put &names;        /* col_1 col_2 col_3 col_4 col_5 col_6                                           */
%put &names_;       /* col_1_ col_2_ col_3_ col_4_ col_5_ col_6_                                     */
%put &names_rename; /* col_1=col_1_ col_2=col_2_ col_3=col_3_ col_4=col_4_ col_5=col_5_ col_6=col_6_ */

data tq84_changed (drop=&names_);
 /* Preserve original order of variables in new data set: */;
    retain &names;
 
 /* Define new data types: */
    attrib col_1 length = $20.; 
    attrib col_2 length = $10.;
    attrib col_3 length = $19.;
    attrib col_4 length = $5. ;
    attrib col_5 length = $15.;
    attrib col_6 length = 8.   format=date9.;
     
 /* Read original data set, rename column names to
    same name with an addes underscore. Names with
    underscore are dropped in drop= statement above. */
    set tq84_data(rename = (&names_rename));

 /* Assign new values from old ones: */
    col_1 =       col_1_             ;
    col_2 = put  (col_2_, ddmmyyp10.);
    col_3 = put  (col_3_, is8601dt. );
    col_4 = put  (col_4_, tod.      );
    col_5 =       col_5_             ;
    col_6 = input(col_6_, ddmmyy10. );

run;

proc sql;
   describe table tq84_changed;
quit;
/*
create table WORK.TQ84_CHANGED( bufsize=65536 )
  (
   col_1 char(20),
   col_2 char(10),
   col_3 char(19),
   col_4 char(5),
   col_5 char(15),
   col_6 num format=DATE9.
  );
*/
proc sql;
  select * from tq84_changed;
quit;
