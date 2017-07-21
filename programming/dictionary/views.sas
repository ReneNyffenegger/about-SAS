proc sql;
  describe table dictionary.views;
quit;


/*
create table DICTIONARY.VIEWS
  (
   libname char(8) label='Library Name',
   memname char(32) label='Member Name',
   memtype char(8) label='Member Type',
   engine char(8) label='Engine Name'
  );
*/
