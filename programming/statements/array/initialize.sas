data _null_;

  array ary[3] (42 999 17);

  do i=1 to dim(ary);
     put 'ary['i']: ' ary[i];
  end;
 
run;
