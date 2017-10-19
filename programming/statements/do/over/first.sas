data _null_;

  txt_1 = 'one';
  txt_2 = 'two';
  txt_3 = 'three';
  txt_4 = 'four';

  length res_1 - res_4 $20;

  array ar_txt txt_1 - txt_4;
  array ar_res res_1 - res_4;

  do over ar_txt;
  /* perform operation on each element on ar_txt
     and assign result to respective element on ar_res; */
     ar_res = cat(ar_txt, ' -> ', upcase(ar_txt));
  end;

  put res_1; /* one -> ONE      */
  put res_2; /* two -> TWO      */
  put res_3; /* three -> THREE  */
  put res_4; /* four -> FOUR    */

run;
