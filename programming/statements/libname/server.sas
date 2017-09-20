%let tq84_srv=host.renenyffenegger.ch 5105;

options comamid=tcp;
options netencrypt
        netencryptalgorithm=SASProprietary;

signon  tq84_srv
        noscript
        user=tq84
        password="{SAS002}5D71C73D177DE3AB1488316D52BDEBDE1ADDF998";

libname tq84_lib "abc.defghi.jklmno.sasdb"
        server = tq84_srv
        disp   = shr;        

proc sql;
  select * from tq84_lib.foo_bar;
quit;

libname tq84_lib clear;
