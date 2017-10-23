%macro containsDigit(txt);
/*     Check if txt contains at least one digit */

   %local pos;
   %let   pos = %sysfunc(prxmatch(/\d/, &txt));

/* The value of pos indicates the position of the first
   character that matches. If the pattern does not match,
   pos will be 0 */

   %if &pos > 0
   %then %put &txt contains a digit at position &pos;
   %else %put &txt does not contain a digit;


%mend  containsDigit;


%containsDigit(foo bar baz) /* foo bar baz does not contain a digit    */
%containsDigit(I say 42)    /* I say 42 contains a digit at position 7 */
