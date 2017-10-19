data _null_;

  seconds =  3*60*60 + /*  3 hours                 */
            18*60    + /* 18 minutes               */ 
            27       + /* 27 seconds               */
            35/100   ; /* 35 hundreths of a second */
 

  put seconds time.   ;  /*  3:18:27     */
  put seconds time12.3;  /*  3:18:27.350 */

run;
