proc sql;
  describe table dictionary.formats;
quit;


/*
create table DICTIONARY.FORMATS
  (
   libname char(8) label='Library Name',
   memname char(32) label='Member Name',
   path char(1024) label='Pathname',
   objname char(32) label='Object Name',
   fmtname char(32) label='Format Name',
   fmttype char(1) label='Format Type',
   source char(1) label='Format Source',
   minw num label='Minimum Width',
   mind num label='Minimum Decimal Width',
   maxw num label='Maximum Width',
   maxd num label='Maximum Decimal Width',
   defw num label='Default Width',
   defd num label='Default Decimal Width'
  );
 */
