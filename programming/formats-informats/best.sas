data _null_;
   
   num = 18888.88;
   int = 123456789012;
   dat ='28aug17'd;
                     /* 123456789 12 */
   put num best12.;  /*      1888.88 */
   put num best.  ;  /*      1888.88 */
   put int best.  ;  /* 123456789012 */
   put dat best.  ;  /*        21059 */ 

run;
