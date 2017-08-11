data _null_;

  /* Initalize array with 1,2,3,1,2,3 */
  array ary[6] (2 * 1:3);

  do i=1 to dim(ary);
     put 'ary[' i ']: ' ary[i];
  end;
 
run;
