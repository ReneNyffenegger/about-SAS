%let one = 'not in macro';
%let two = 'not in macro';

%macro m;
  %local  one;
  %global four;

  %let one   = 'in macro';
  %let two   = 'in macro';
  %let three = 'in macro';
  %let four  = 'in macro';

%mend m;

%m;

%put one   = &one;
%put two   = &two;
%put three = &three;
%put four  = &four;
