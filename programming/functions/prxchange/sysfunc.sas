%macro removeNumAtEnd(text);

  %local result;
  %let   result = %sysfunc(prxchange(s/\d+$//,  -1, &text));
  &result

%mend  removeNumAtEnd;

%put %removeNumAtEnd(Say 42 times hello); /* Say 42 times hello */
%put %removeNumAtEnd(Say hello times 42); /* Say hello times    */
