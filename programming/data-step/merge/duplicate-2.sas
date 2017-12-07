data english;
  length en $10.;
  num = 1; en = 'one'  ; output;
  num = 2; en = 'two'  ; output;
  num = 3; en = 'three'; output;
  num = 4; en = 'four' ; output;
  num = 5; en = 'five' ; output;
  num = 5; en = 'FIVE' ; output;
run;

data german;
  length gr $10.;
  num = 1; gr = 'eins' ; output;
  num = 2; gr = 'zwei' ; output;
  num = 3; gr = 'drei' ; output;
  num = 4; gr = 'vier' ; output;
  num = 5; gr = 'fünf' ; output;
  num = 5; gr = 'fuenf'; output;
run;

data translation;
  merge english german;
  by    num;
run;

proc print data=translation noobs; run;
/*
    en      num     gr
   
   one       1     eins 
   two       2     zwei
   three     3     drei 
   four      4     vier 
   five      5     fünf
   FIVE      5     fuenf
*/

/* Join with ordinary SQL produces 8 records. */
proc sql;
  select
    en.en,
    en.num,
    gr.gr
  from
    english en join
    german  gr on en.num = gr.num;
quit;
/*
  en               num  gr
  --------------------------------
  one                1  eins      
  two                2  zwei      
  three              3  drei      
  four               4  vier      
  five               5  fünf     
  five               5  fuenf     
  FIVE               5  fünf     
  FIVE               5  fuenf     
*/
