%macro oraUserServer(oraLib);

  proc sql;
    connect using &oraLib;

    select * from connection to &oraLib (
      select user, global_name from global_name
    )
  quit;

%mend  oraUserServer;
