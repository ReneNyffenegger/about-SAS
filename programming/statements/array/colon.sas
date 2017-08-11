data _null_;

   var_foo = 'Foo';
   var_bar = 'Bar';
   var_baz = 'Baz';

/* Variables with a common prefix (here: "var_")  can
   be referenced with a colon: */
   array ary{*} var_:;

   do i=1 to dim(ary);
      put 'ary ' i ': ' ary[i];
   end;
/* The put statement puts:
     ary 1 : Foo
     ary 2 : Bar
     ary 3 : Baz
*/

run;
