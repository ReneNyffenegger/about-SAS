proc sql;
  describe table dictionary.options;
quit;

/*


create table DICTIONARY.OPTIONS
  (
   optname char(32) label='Option Name',
   opttype char(8) label='Option type',
   setting char(1024) label='Option Setting',
   optdesc char(160) label='Option Description',
   level char(8) label='Option Location',
   group char(32) label='Option Group'
  );

*/
