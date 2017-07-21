proc sql;
  describe table dictionary.dictionaries;
quit;

/*
create table DICTIONARY.DICTIONARIES
  (
   memname char(32) label='Member Name',
   memlabel char(256) label='Data Set Label',
   name char(32) label='Column Name',
   type char(4) label='Column Type',
   length num label='Column Length',
   npos num label='Column Position',
   varnum num label='Column Number in Table',
   label char(256) label='Column Label',
   format char(49) label='Column Format',
   informat char(49) label='Column Informat'
  );
*/
