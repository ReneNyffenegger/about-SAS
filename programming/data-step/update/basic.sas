data tq84_master;
  length txt $10.;
  num = 1; txt = 'one'  ; output;
  num = 2; txt = 'two'  ; output;
  num = 3; txt = 'trhee'; output; /* Note the typo      */
  num = 4; txt = 'four' ; output;
  num = 6; txt = 'six'  ; output; /* Note the missing 5 */
run;

data tq84_transaction;
  length txt $10.;
  num = 3; txt = 'three'; output; /* Fix the typo        */
  num = 5; txt = 'five' ; output; /* Add the missing 5   */
run;

data tq84_updated;
  update
    tq84_master
    tq84_transaction;
    by num;
run;

proc print data=tq84_updated noobs; run;
/*
   txt     num
  
  one       1 
  two       2 
  three     3 
  four      4 
  five      5 
  six       6 
*/
