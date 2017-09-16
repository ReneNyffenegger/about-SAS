data _null_;

  if 4 > 2 then do; /* start do group */
  
       put "-----------";
       put "-- 4 > 2 --";
       put "-----------";
     
     end;  /* end belongs to do, not to if */
  else do; /* start another do group for else */
  
       put "--------------";
       put "never reached!";
       put "--------------";
  
     end;

run;
