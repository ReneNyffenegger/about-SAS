data _null_;

   val = 18888.88;
                        /* 123456789 12345678 */
   put val mmddyy10. ;  /* 09/18/2011         */
   put val mmddyyb10.;  /* 09 18 2011         */
   put val mmddyyc10.;  /* 09:18:2011         */  
   put val mmddyyd10.;  /* 09-18-2011         */ 
/* put val mmddyyn10.;                        */
   put val mmddyyp10.;  /* 09.18.2011         */ 
   put val mmddyys10.;  /* 09/18/2011         */ 

   put val mmddyy8.  ;  /* 09/18/11           */ 
   put val mmddyyb8. ;  /* 09 18 11           */ 
   put val mmddyyc8. ;  /* 09:18:11           */ 
   put val mmddyyd8. ;  /* 09-18-11           */ 
   put val mmddyyp8. ;  /* 09.18.11           */ 
   put val mmddyys8. ;  /* 09/18/11           */ 

   put val mmddyy7.  ;  /*  091811            */ 
   put val mmddyy6.  ;  /* 091811             */ 
   put val mmddyy5.  ;  /* 09/18              */ 
   put val mmddyy4.  ;  /* 0918               */ 
   put val mmddyy3.  ;  /*  09                */ 
   put val mmddyy2.  ;  /* 09                 */ 

run;
