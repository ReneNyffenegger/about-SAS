data _null_;

   dt = '03aug2017'd;

   put dt yymmn8.;                   /*   201708 */
   put dt yymmn6.;                   /* 201708   */
   put dt yymmn4.;                   /* 1708     */

   dt_in = input('201503', yymmn6.);
   put dt_in date9.;                 /* 01MAR2015 */

run;
