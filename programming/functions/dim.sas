data _null_;

  array ary_a{   *} a1-a10;
  array ary_b{  10} b1-b10;
  array ary_c{5:14} c1-c10;

  /* Determine the number of elements in an array */
  dim_a = dim(ary_a);
  dim_b = dim(ary_b);
  dim_c = dim(ary_c);

  put dim_a=; /* dim_a=10 */
  put dim_b=; /* dim_b=10 */
  put dim_c=; /* dim_c=10 */

run;
