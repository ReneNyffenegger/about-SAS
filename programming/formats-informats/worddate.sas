data _null_;

   val = 18888.88;
                       /* 123456789 12345678 */
   put val worddate.  ; /* September 18, 2011 */
   put val worddate18.; /* September 18, 2011 */
   put val worddate17.; /*      Sep 18, 2011  */
   put val worddate12.; /* Sep 18, 2011       */
   put val worddate11.; /*   September        */
   put val worddate9. ; /* September          */
   put val worddate8. ; /*      Sep           */
   put val worddate3. ; /* Sep                */

/* put val worddate2. ;  Width specified for format WORDDATE is invalid */
    
run;
