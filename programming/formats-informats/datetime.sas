data _null_;

   val = 3 * 24 * 60 * 60 + /* January 4th, 1960 */
             16 * 60 * 60 + /* 16th hour         */
                  21 * 60 + /* 21st minute       */
                       38;  /* 38th second       */

                         /* 123456789 123456789 123456789 */
   put val datetime17. ; /*  04JAN60:16:21:38             */
   put val datetime16. ; /* 04JAN60:16:21:38              */
   put val datetime15. ; /*   04JAN60:16:21               */
   put val datetime13. ; /* 04JAN60:16:21                 */
   put val datetime12. ; /*   04JAN60:16                  */
   put val datetime10. ; /* 04JAN60:16                    */
   put val datetime9.  ; /* 04JAN1960                     */
   put val datetime8.  ; /*  04JAN60                      */
   put val datetime7.  ; /* 04JAN60                       */
     
run;
