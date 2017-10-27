%macro doubleToHex(dbl);
   dbl = &dbl;
   rb  = put(dbl, rb8.  ); /* A double is 8 bytes */
   hex = put(rb  , hex16.); /* The hexadecimal representation is 16 bytes wide */
   put dbl " = " hex;
%mend  doubleToHex;

data _null_;
  %doubleToHex(0.0)
  %doubleToHex(1.0)
  %doubleToHex(2.0)
  %doubleToHex(0.5)
  %doubleToHex(1.5)
run;
