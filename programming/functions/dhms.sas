data _null_;

   t_dhms = dhms('02jan60'd, 2, 3, 4);
   t_calc = 1*24*60*60 +
            2   *60*60 +
            3      *60 +
            4;

   put t_dhms=; /* 93784 */
   put t_calc=; /* 93784 */

run;
