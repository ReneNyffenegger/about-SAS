data _null_;

/* Comments are either between
   slash-star and star-slash */

* or between * and semicolon;



%macro temporary_commented;

  A macro definition with any name (such
  as temporary_commented) can be used to
  comment a block of code

  /* foo bar baz */

%mend;

  put 'Hello world.';
run;
