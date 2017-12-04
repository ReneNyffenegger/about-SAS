%macro put_constant(name, desc);
  c = constant("&name");
  put     "&desc" 
      @40 "&name:" 
      c 51-71 .9;
%mend  put_constant;

data _null_;
  %put_constant(big         ,Largest double-precision number)
  %put_constant(e           ,Natural base                   )
  %put_constant(euler       ,Euler%str(%')s constant        )
  %put_constant(logbig      ,LOG of BIG                     )
  %put_constant(logmaceps   ,         MACEPS                )
  %put_constant(maceps      ,Machine precision              )
  %put_constant(pi          ,Ï€                              )
  %put_constant(small       ,Smalles double-precision number)
  %put_constant(sqrtsmall   ,Square root of SMALL           )
  %put_constant(sqrtmaceps  ,Square root of MACEPS          )
run;
/*
Largest double-precision number        big:         1.7976931348623E308
Natural base                           e:                   2.718281828
Euler's constant                       euler:               0.577215665
LOG of BIG                             logbig:            709.782712893
MACEPS                                 logmaceps:         -36.043653389
Machine precision                      maceps:              0.000000000
Ï€                                      pi:                  3.141592654
Smalles double-precision number        small:               0.000000000
Square root of SMALL                   sqrtsmall:           0.000000000
Square root of MACEPS                  sqrtmaceps:          0.000000015
*/
