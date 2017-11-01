libname ora_lib clear;

libname ora_lib
   oracle
   user     = rene
   password = secretGarden
   path = "(
       description=(
           address =(protocol=tcp)
          (host    = ora12.renenyffenegger.ch)
          (port    = 1521)
       )
       (
           connect_data=(service_name=ora12.renenyffenegger.ch)
        )
     )"
;

proc sql;
  select g.global_name from ora_lib.global_name g;
quit;
