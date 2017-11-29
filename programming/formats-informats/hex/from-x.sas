data _null_;
  chr              = '0102030405060708090a0b'x;
  put chr $hex50.; /* 0102030405060708090A0B */
run;
