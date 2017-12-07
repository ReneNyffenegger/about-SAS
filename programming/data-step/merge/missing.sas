data english;
  length en $10.;
  num = 1; en = 'one'  ; output;
  num = 2; en = 'two'  ; output;
  num = 3; en = 'three'; output;
  num = 4; en = 'four' ; output;
run;

data german;
  length gr $10.;
  num = 1; gr = 'eins' ; output;
  num = 3; gr = 'drei' ; output;
  num = 4; gr = 'vier' ; output;
  num = 5; gr = 'fünf' ; output;
run;

data translation;
  merge english german;
  by    num;
run;

proc print data=translation noobs; run;
/*
    en      num     gr
   
   one       1     eins 
   two       2          
   three     3     drei 
   four      4     vier 
             5     fünf
*/
