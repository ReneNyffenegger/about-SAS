data _null_;

  array ary_a{   *} a1-a10;
  array ary_b{  10} b1-b10;
  array ary_c{5:14} c1-c10;
  
  hbound_a = hbound(ary_a);
  hbound_b = hbound(ary_b);
  hbound_c = hbound(ary_c);

  put hbound_a=; /* hbound_a=10 */
  put hbound_b=; /* hbound_b=10 */
  put hbound_c=; /* hbound_c=14 */

run;
