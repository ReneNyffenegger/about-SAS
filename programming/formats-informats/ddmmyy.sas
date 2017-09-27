data _null_;

   val = 18888.88;
                        /* 123456789 12345678 */
   put val ddmmyy10. ;  /* 18/09/2011         */
   put val ddmmyyb10.;  /* 18 09 2011         */
   put val ddmmyyc10.;  /* 18:09:2011         */  
   put val ddmmyyd10.;  /* 18-09-2011         */ 
/* put val ddmmyyn10.;                        */
   put val ddmmyyp10.;  /* 18.09.2011         */ 
   put val ddmmyys10.;  /* 18/09/2011         */ 

   put val ddmmyy8.  ;  /* 18/09/11           */ 
   put val ddmmyyb8. ;  /* 18 09 11           */ 
   put val ddmmyyc8. ;  /* 18:09:11           */ 
   put val ddmmyyd8. ;  /* 18-09-11           */ 
   put val ddmmyyp8. ;  /* 18.09.11           */ 
   put val ddmmyys8. ;  /* 18/09/11           */ 

   put val ddmmyy7.  ;  /*  180911            */ 
   put val ddmmyy6.  ;  /* 180911             */ 
   put val ddmmyy5.  ;  /* 18/09              */ 
   put val ddmmyy4.  ;  /* 1809               */ 
   put val ddmmyy3.  ;  /*  18                */ 
   put val ddmmyy2.  ;  /* 18                 */ 
   
run;
