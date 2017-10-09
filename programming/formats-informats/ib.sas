data _null_;

  num = 256 * 256 * 256 * 68 + /* D */
              256 * 256 * 67 + /* C */
                    256 * 66 + /* B */
                          65;  /* A */

  put num ib4.;  /* ABCD */

run;
