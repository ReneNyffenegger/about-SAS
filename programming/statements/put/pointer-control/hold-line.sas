data _null_;
   
/* A trailing at sign (line-hold specifier) does not put
   a new-line (carriage return), the next the put write
   on the same line */
 
   put "foo" @;
   put "bar" @;
   put "baz";

   put "one" @;
   put "two" @;
   put "three";

run;
