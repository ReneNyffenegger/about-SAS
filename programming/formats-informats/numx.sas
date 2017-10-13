data _null_;

  num = 42.123;

  put num numx8.5; /* 42,12300 */
  put num numx7.5; /* 42,1230  */
  put num numx6.5; /* 42,123   */
  put num numx6.4; /* 42,123   */
  put num numx6.3; /* 42,123   */
  put num numx6.2; /*  42,12   */

run;
