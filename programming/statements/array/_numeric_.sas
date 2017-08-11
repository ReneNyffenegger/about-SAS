data _null_;

   var_foo  =  42;
   var_bar  = 999;
   var_baz  =  17;
   var_char ='foo bar baz';

/* All non-temporary numeric variables can be referenced
   with _numeric_: */
   array ary{*} _numeric_;

   do i=1 to dim(ary);
      put 'ary ' i ': ' ary[i];
   end;
/* The put statement puts:
     ary 1 : 42
     ary 2 : 999
     ary 3 : 17
*/

run;
