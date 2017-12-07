data english;
  length en $10.;
  num = 4; en = 'four' ; output;
  num = 3; en = 'three'; output;
  num = 2; en = 'two'  ; output;
  num = 1; en = 'one'  ; output;
  num = 5; en = 'five' ; output;
run;

data german;
  length gr $10.;
  num = 1; gr = 'eins' ; output;
  num = 2; gr = 'zwei' ; output;
  num = 5; gr = 'fünf' ; output;
  num = 4; gr = 'vier' ; output;
  num = 3; gr = 'drei' ; output;
run;

data translation;
  merge english german;
  by    num;
run;
/* ERROR: BY variables are not properly sorted on data set WORK.ENGLISH. */
