data some_floats;

     format c_3_0 comma3.0; /* At most three characters, no decimal places         s*/
     format c_3_1 comma3.1; /* At most three characters, at most one decimal place  */
     format c_3_2 comma3.2; /* At most three characters, at most twe decimal places */
     
     c_3_0 =   1/3;  /* ->  0     */
     c_3_1 =   1/3;  /* ->  0.3   */    
     c_3_2 =   1/3;  /* ->   .33  */    

     output;

     c_3_0 =  10/3;  /* ->  3     */
     c_3_1 =  10/3;  /* ->  3.3   */
     c_3_2 =  10/3;  /* ->  3.3   */

     output;

     c_3_0 = 100/3;  /* -> 33     */
     c_3_1 = 100/3;  /* -> 33     */
     c_3_2 = 100/3;  /* -> 33     */

     output;

run;
