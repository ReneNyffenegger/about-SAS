data _null_;

   format var_fmt ddmmyy10.;

   var_num =   42;
   var_fmt = 4242;

/* Named put, format is applied:                                       */
   put var_num= var_fmt=; /*             var_num=42 var_fmt=13/08/1917 */

/* Column put, format is not applied:                                  */
   put var_num 1-10 var_fmt 13-23;               42         4242       */

run;
