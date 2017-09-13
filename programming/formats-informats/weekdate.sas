data _null_;
   val = 21075.75;
                        /* 123456789 123456789 123456789 */
   put val weekdate.  ; /* Wednesday, September 13, 2017 */
   put val weekdate29.; /* Wednesday, September 13, 2017 */
   put val weekdate28.; /*      Wednesday, Sep 13, 2017  */
   put val weekdate23.; /* Wednesday, Sep 13, 2017       */
   put val weekdate22.; /*      Wed, Sep 13, 2017        */
   put val weekdate17.; /* Wed, Sep 13, 2017             */
   put val weekdate16.; /*  Wed, Sep 13, 17              */
   put val weekdate15.; /* Wed, Sep 13, 17               */
   put val weekdate14.; /*      Wednesday                */
   put val weekdate9. ; /* Wednesday                     */
   put val weekdate8. ; /*      Wed                      */
   put val weekdate3. ; /* Wed                           */

/* put val weekdate2. ; ERROR 29-185: Width specified for format WEEKDATE is invalid. */

run;
