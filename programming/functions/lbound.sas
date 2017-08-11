data _null_;

  array ary_a{   *} a1-a10;
  array ary_b{  10} b1-b10;
  array ary_c{5:14} c1-c10;
  
  lbound_a = lbound(ary_a);
  lbound_b = lbound(ary_b);
  lbound_c = lbound(ary_c);

  put lbound_a=; /* lbound_a=1 */
  put lbound_b=; /* lbound_b=1 */
  put lbound_c=; /* lbound_c=5 */

run;
