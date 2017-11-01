%let one = set globally;
%let two = set globally;

%macro m;

   %local  one;
   %global four;

/* Variable one is declared local. Assigning to it
   won't overwrite the global variable with the
   same name: */
   %let one   = set in macro;

/* Variable two is a global variable. Because it
   is not declared local in this macro, the assignment
   overwrites the global variable. */
   %let two   = set in macro;

/* Variable three is not available in the global
   variable space - nor is it declared global in this
   macro. Hence, a local variable will be created here */
   %let three = set in macro;

/* Variable four is not available in the global
   variable space - but it was declared global in
   this macro. Hence, the value assigned here will
   be visible globally. */
   %let four  = set in macro;
%mend m;

%m;

%put one   = &one;   /* one   = set globally */
%put two   = &two;   /* two   = set in macro */
%put three = &three; /* WARNING: Apparent symbolic reference THREE not resolved. 
                        three = &three */
%put four  = &four;  /* four  = set in macro */
