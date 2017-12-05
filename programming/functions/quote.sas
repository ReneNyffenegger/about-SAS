data _null_;
   q1 = quote('foo"bar');
   put q1=;                /* q1="foo""bar" */
   l1 = lengthc(q1);
   put l1=;                /* l1=200        */
   length q2 $42.;
   q2 = quote("O'Brian");
   put q2=;                /* q2="O'Brian"  */
   l2 = lengthc(q2);
   put l2=;                /* l2=42         */
run;
