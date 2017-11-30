data tq84_ds;
  attrib col_foo length=$10;
  attrib col_bar format=words20.;
  attrib col_baz length=  8;

  col_foo = 'foo';
  col_bar =   42 ;
  col_baz =   99 ;

  output;
run;

     position /* Output variables by position. Default is alphabetical! */

proc contents
     data = tq84_ds
     noprint
     out  = tq84_ds_contents
     ;
run;

proc sql;
     describe table tq84_ds_contents;
quit;
/*
create table WORK.TQ84_DS_CONTENTS( bufsize=73728 )
  (
   LIBNAME char(8) label='Library Name',
   MEMNAME char(32) label='Library Member Name',
   MEMLABEL char(256) label='Data Set Label',
   TYPEMEM char(8) label='Special Data Set Type (From TYPE=)',
   NAME char(32) label='Variable Name',
   TYPE num label='Variable Type',
   LENGTH num label='Variable Length',
   VARNUM num label='Variable Number',
   LABEL char(256) label='Variable Label',
   FORMAT char(32) label='Variable Format',
   FORMATL num label='Format Length',
   FORMATD num label='Number of Format Decimals',
   INFORMAT char(32) label='Variable Informat',
   INFORML num label='Informat Length',
   INFORMD num label='Number of Informat Decimals',
   JUST num label='Justification',
   NPOS num label='Position in Buffer',
   NOBS num label='Observations in Data Set',
   ENGINE char(8) label='Engine Name',
   CRDATE num format=DATETIME16. label='Create Date',
   MODATE num format=DATETIME16. label='Last Modified Date',
   DELOBS num label='Deleted Observations in Data Set',
   IDXUSAGE char(9) label='Use of Variable in Indexes',
   MEMTYPE char(8) label='Library Member Type',
   IDXCOUNT num label='Number of Indexes for Data Set',
   PROTECT char(3) label='Password Protection (Read Write Alter)',
   FLAGS char(3) label='Update Flags (Protect Contribute Add)',
   COMPRESS char(8) label='Compression Routine',
   REUSE char(3) label='Reuse Space',
   SORTED num label='Sorted and/or Validated',
   SORTEDBY num label='Position of Variable in Sortedby Clause',
   CHARSET char(8) label='Host Character Set',
   COLLATE char(8) label='Collating Sequence',
   NODUPKEY char(3) label='Sort Option: No Duplicate Keys',
   NODUPREC char(3) label='Sort Option: No Duplicate Records',
   ENCRYPT char(8) label='Encryption Routine',
   POINTOBS char(3) label='Point to Observations',
   GENMAX num label='Maximum Number of Generations',
   GENNUM num label='Generation Number',
   GENNEXT num label='Next Generation Number',
   TRANSCOD char(3) label='Character Variables Transcoded'
  );
*/

proc print
     data=tq84_ds_contents
     noobs;
     var
       varnum
       name
       type
       length
     ;
run;
/*
VARNUM     NAME      TYPE    LENGTH

   2      col_bar      1        8
   3      col_baz      1        8
   1      col_foo      2       10

----
   type=1 indicates numeric and type=2 indicates character.
*/
