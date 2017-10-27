%macro doubleToHex(dbl);
   dbl = &dbl;
   rb  = put(dbl, rb8.  ); /* A double is 8 bytes */
   hex = put(rb  , hex16.); /* The hexadecimal representation is 16 bytes wide */
   put dbl " = " hex;
%mend  doubleToHex;

data _null_;
  %doubleToHex(0.0) /* 0  = 0000000000000000 */
  %doubleToHex(1.0) /* 1  = 000000000000F03F */
  %doubleToHex(2.0) /* 2  = 0000000000000040 */
  %doubleToHex(0.5) /* 0.5  = 000000000000E03F */
  %doubleToHex(1.5) /* 1.5  = 000000000000F83F */
run;
