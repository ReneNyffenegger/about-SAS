%let array_1through4  = %tq84_array(one two three four);

%put array_1through4 = &array_1through4<;

%put &tq84_array_0_1; /* one   */
%put &tq84_array_0_2; /* two   */
%put &tq84_array_0_3; /* three */
%put &tq84_array_0_4; /* four  */
