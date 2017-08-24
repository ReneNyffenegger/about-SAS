/*
   With the mprint system option turned on, SAS will print
   the generated code into the log.
   
   This is useful for debugging purposes.
*/

options mprint;

%macro tq84_m(nof_obs, nof_attrs);
data tq84_data;

  drop obs;

  do obs=1 to &nof_obs;
      %do varno = 1 %to &nof_attrs;
          var_&varno = rand('norm');
      %end;
      output;
  end;

run;
%mend tq84_m;

%tq84_m(5, 3);
/*
MPRINT(TQ84_M):   data tq84_data;
MPRINT(TQ84_M):   drop obs;
MPRINT(TQ84_M):   do obs=1 to 5;
MPRINT(TQ84_M):   var_1 = rand('norm');
MPRINT(TQ84_M):   var_2 = rand('norm');
MPRINT(TQ84_M):   var_3 = rand('norm');
MPRINT(TQ84_M):   output;
MPRINT(TQ84_M):   end;
MPRINT(TQ84_M):   run;
*/
