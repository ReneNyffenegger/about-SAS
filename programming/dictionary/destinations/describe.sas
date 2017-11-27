proc sql;
  describe table dictionary.destinations;
quit;
/*
create table DICTIONARY.DESTINATIONS
  (
   destination char(100) label='Destination',
   style char(32) label='Style'
  );
*/
