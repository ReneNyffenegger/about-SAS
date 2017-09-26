data _null_;
   val = 21075.75;
                        /* 123456789 123456789 123456789 */
   put val date11.    ; /* 13-SEP-2017                   */
   put val date10.    ; /*  13SEP2017                    */
   put val date9.     ; /* 13SEP2017                     */
   put val date8.     ; /*  13SEP17                      */
   put val date7.     ; /* 13SEP17                       */
   put val date6.     ; /*  13SEP                        */
   put val date5.     ; /* 13SEP                         */
     
run;
