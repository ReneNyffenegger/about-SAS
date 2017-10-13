data _null_;

  num = 42.123;

  put num 8.5; /* 42.12300 */
  put num 7.5; /* 42.1230  */
  put num 6.5; /* 42.123   */
  put num 6.4; /* 42.123   */
  put num 6.3; /* 42.123   */
  put num 6.2; /*  42.12   */

run;
