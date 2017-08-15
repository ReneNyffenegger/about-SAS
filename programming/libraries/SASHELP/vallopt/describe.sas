proc sql;

  describe view sashelp.vallopt;

quit;
/*
SQL view SASHELP.VALLOPT is defined as:

        select *
          from DICTIONARY.OPTIONS
        union
        select *
          from DICTIONARY.GOPTIONS;
*/
