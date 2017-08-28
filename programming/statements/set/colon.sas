data tq84_a;
  val = 1; num = 'one'; output;
  val = 2; num = 'two'; output;
run;

data tq84_b;
  val = 3; num = 'three'; output;
  val = 4; num = 'four' ; output;
run;

data tq84_a_plus_b;
  /*
     The colon selects all data sets that match
     the preceeding string (here: tq84_a and
     tq84_b 
  */
  set tq84_:;
run;

proc print
     data = tq84_a_plus_b;
run;
