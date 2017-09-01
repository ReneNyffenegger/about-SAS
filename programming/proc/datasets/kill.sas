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
     library=tq84_lib
     kill;/* Delete all files in the library at once */
run;

proc sql;
  select memname
  from   dictionary.members
  where  libname = 'TQ84_LIB';
quit;
