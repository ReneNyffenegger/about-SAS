/*    Create a libref for the library in which the catalog will be stored: */
libname  tq84_lib '/home/tq84/lib';

/*   Add a source entry to the the tq84Catalog: */
filename src_cat catalog 'tq84_lib.tq84Catalog.tq84Prog.source';
data _null_;
  file src_cat;
  put  'filename tq84Data  catalog "tq84_lib.tq84Catalog.tq84Data";';
  put  'data _null_;';
  put  '  infile tq84Data;';
  put  '  input;';
  put  '  put _infile_;';
  put  'run;';
  put  'filename tq84Data clear;';
run;
filename src_cat clear;


/*   Add a format to the tq84Catalog: */
proc format
     library=tq84_lib.tq84Catalog;
     value tq84Size
           1 = 'small'
           2 = 'medium'
           3 = 'large';
run;

/*   proc format ... select can be used to get the
     details of the format from the catalog: */
proc format
     library=tq84_lib.tq84Catalog;
     select tq84Size;
run;
 /*  In order to find the format, the fmt option might be used:
      option fmtsearch (tq84_lib.tq84Catalog); */
  
/*   Add data to the catalog: */
filename dat_cat catalog 'tq84_lib.tq84Catalog.tq84Data.catams';
data _null_;
   file   dat_cat;
   format num   8.
          txt $10.;
   /* */
   num = 1; txt = 'one'  ; put num txt;
   num = 2; txt = 'two'  ; put num txt;
   num = 3; txt = 'three'; put num txt;
   num = 4; txt = 'four' ; put num txt;
   num = 5; txt = 'five' ; put num txt;
run;
filename dat_cat clear;

/*   Show the contents of the catalog */
proc catalog
     catalog=tq84_lib.tq84Catalog;
     contents;
run;
/*                     Contents of Catalog TQ84_LIB.TQ84CATALOG

 #    Name        Type              Create Date          Modified Date    Description
 ------------------------------------------------------------------------------------
 1    TQ84DATA    CATAMS    12/06/2017 15:05:00    12/06/2017 15:05:00
 3    TQ84SIZE    FORMAT    12/06/2017 15:20:18    12/06/2017 15:20:18
 4    TQ84PROG    SOURCE    12/06/2017 14:54:52    12/06/2017 14:54:52
*/

/* Execute the program stored in the catalog: */
filename tq84_cat catalog 'tq84_lib.tq84Catalog';
%include tq84_cat (tq84Prog)/source2;
filename tq84_cat clear;

/* Clear the libref: */
libname  tq84_lib clear;
