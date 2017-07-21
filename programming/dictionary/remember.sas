proc sql;
  describe table dictionary.remember;
quit;

/*
create table DICTIONARY.REMEMBER
  (
   libname char(8) label='Library Name',
   memname char(32) label='Member Name',
   offset num label='Offset into Text Remembered',
   rtext char(200) label='Text Remembered',
   pw char(8) label='Password'
  );
*/
