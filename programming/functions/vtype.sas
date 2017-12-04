data  _null_;

   num                 = 42;
   str                 = 'fourty-two';
   num_missing         = .;
   num_missing_special = .q;

   num_type                 = vtype(num        );
   str_type                 = vtype(str        );
   num_missing_type         = vtype(num_missing);
   num_missing_special_type = vtype(num_missing);

   put num_type=                     ; /* num_type=N                 */
   put str_type=                     ; /* str_type=C                 */
   put num_missing_type=             ; /* num_missing_type=N         */
   put num_missing_special_type=type=; /* num_missing_special_type=N */

run;
