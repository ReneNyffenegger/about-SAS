proc sql;
  describe table dictionary.extfiles;
quit;

/*
create table DICTIONARY.EXTFILES
  (
   fileref char(8) label='Fileref',
   xpath char(1024) label='Pathname',
   xengine char(8) label='Engine Name',
   modate num format=DATETIME informat=DATETIME label='Date Modified',
   filesize num label='Size of File',
   level num label='File Concatenation Level',
   directory char(3) label='Directory?',
   exists char(3) label='Exists?',
   temporary char(3) label='Temporary?'
  );
*/
