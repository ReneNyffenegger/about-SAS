data _null_;

   var_foo  =  42;
   var_bar  = 999;
   var_baz  =  17;
   var_chr1 ='foo';
   var_chr2 ='bar';
   var_chr3 ='baz';



/* All non-temporary character variables can be referenced
   with _character_: */
   array ary{*} _character_;

   do i=1 to dim(ary);
      put 'ary ' i ': ' ary[i];
   end;
/* The put statement puts:
       ary 1 : foo
       ary 2 : bar
       ary 3 : baz
*/

run;
