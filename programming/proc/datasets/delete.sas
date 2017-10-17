libname tq84_lib 'p:\ath\to\some\directory';

data tq84_lib.member_one  ; x=1; output; run;
data tq84_lib.member_two  ; x=2; output; run;
data tq84_lib.member_three; x=3; output; run;

proc sql;
  select memname
  from   dictionary.members
  where  libname = 'TQ84_LIB';
quit;

proc datasets
     library = tq84_lib;
     delete member_one member_three; /* remove some members/data sets from the library. */
run;

proc sql;
  select memname
  from   dictionary.members
  where  libname = 'TQ84_LIB';
quit;
