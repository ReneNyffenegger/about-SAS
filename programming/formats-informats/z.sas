data _null_;

   val = 12345.789;
                        /* 1234567890  */
   put val z.         ; /* *           */
   put val z3.        ; /* 1E4         */
   put val z3.1       ; /* 1E4         */
   put val z6.1       ; /* 012346      */
   put val z6.3       ; /* 012346      */
   put val z7.1       ; /* 12345.8     */
   put val z7.2       ; /* 12345.8     */
   put val z10.2      ; /* 0012345.79  */
   put val z10.3      ; /* 012345.789  */
   put val z10.4      ; /* 12345.7890  */
    
run;
