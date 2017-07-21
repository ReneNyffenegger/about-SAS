proc sql;
  describe table dictionary.titles;
quit;

/*
create table DICTIONARY.TITLES
  (
   type char(1) label='Title Location',
   number num label='Title Number',
   text char(256) label='Title Text'
  );
*/
