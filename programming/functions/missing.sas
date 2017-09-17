%macro put_data_type_and_missing(var);

  data_type = vtype(&var);
  is_missing = missing(&var);
  
  put "&var - data type: " data_type ", missing: " is_missing;

%mend;

data _null_;

  c1 = 'fourty two'; /* Create a non-missing character variable */
  c2 = ' ';          /* Create a missing character variable (note the space!) */
  n1 = 42;           /* Create a non-missing numeric variable */
  n2 = .;            /* Create a missing numeric variable (note the dot) */
  
  %put_data_type_and_missing(c1); /*  c1 - data type: C , missing: 0 */
  %put_data_type_and_missing(c2); /*  c2 - data type: C , missing: 1 */
  %put_data_type_and_missing(n1); /*  n1 - data type: N , missing: 0 */
  %put_data_type_and_missing(n2); /*  n2 - data type: N , missing: 1 */
  
run;
