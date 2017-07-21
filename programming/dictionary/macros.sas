proc sql;
  describe table dictionary.macros;
quit;

/*
create table DICTIONARY.MACROS
  (
   scope char(32) label='Macro Scope',
   name char(32) label='Macro Variable Name',
   offset num label='Offset into Macro Variable',
   value char(200) label='Macro Variable Value'
  );
*/
