data _null_;

  length w1 $ 1;
  length w2 $ 2;
  length w3 $ 3;

  w1="foo";
  w2="bar";
  w3="baz";

  put w1=;
  put w2=;
  put w3=;
 
run;

/*

w1=f
w2=ba
w3=baz

*/
