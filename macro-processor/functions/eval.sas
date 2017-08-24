%let one_plus_one = 1+1;
%put &one_plus_one; /* "1+1" */
%let two = %eval(&one_plus_one);
%put &two; /* "2" */
