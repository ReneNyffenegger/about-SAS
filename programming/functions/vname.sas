data _null_;
  
  foo = 'one';
  bar = 'two';
  baz = 'three';
  
  array ary(3) foo bar baz;
  
  vnam_1 = vname(ary(1));
  vnam_2 = vname(ary(2));
  vnam_3 = vname(ary(3));
  
  vnam_foo = vname(foo);
  
  put 'ary(1)is in fact: ' vnam_1; /* ary(1)is in fact: foo */
  put 'ary(2)is in fact: ' vnam_2; /* ary(2)is in fact: bar */
  put 'ary(3)is in fact: ' vnam_3; /* ary(3)is in fact: baz */
 
  put 'foo is, of course: ' vnam_foo; /* foo is, of course: foo */

run;
