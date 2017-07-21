proc sql;
  describe table dictionary.engines;
quit;

/*
create table DICTIONARY.ENGINES
  (
   engine char(8) label='Engine Name',
   alias char(8) label='Alias',
   description char(40) label='Description',
   preferred char(3) label='Preferred?',
   properties char(1024) label='Engine Dialog Properties'
  );
*/
