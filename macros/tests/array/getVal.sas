%let oneTwoThreeEtc = %tq84_array(one two three four five six seven eight nine ten);

%put Element 5 in oneTwoThreeEtc is %tq84_arrayGetVal(&oneTwoThreeEtc, 5); /* Element 5 in oneTwoThreeEtc is five  */
%put Element 8 in oneTwoThreeEtc is %tq84_arrayGetVal(&oneTwoThreeEtc, 8); /* Element 8 in oneTwoThreeEtc is eight */
