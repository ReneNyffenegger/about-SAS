data _null_;

   h05_m16_32s =  5 * 60 * 60 +
                 16 * 60      +
                 32           +
                 16/100;

   put h05_m16_32s hhmm.   ;   /* 5:17       */
   put h05_m16_32s tod.    ;   /*05:16:32    */
   put h05_m16_32s time.   ;   /* 5:16:32    */

   put h05_m16_32s hhmm11. ;   /*       5:17 */
   put h05_m16_32s tod11.  ;   /*   05:16:32 */
   put h05_m16_32s time11. ;   /*    5:16:32 */

   put h05_m16_32s hhmm11.2;   /*    5:16.54      Note: .54 is a fraction of a minute. */
   put h05_m16_32s tod11.2 ;   /*05:16:32.16 */
   put h05_m16_32s time11.2;   /* 5:16:32.16 */

run;
