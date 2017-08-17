data tq84_data;

  /* Set the length of each element of the array
     to 20 characters: */
  array num{*} $20 num_1-num_10;
  input num_1-num_10;

datalines;
one two three four five six seven eight nine ten
eins zwei drei vier fünf sechs sieben acht neun zehn
un deux trois quattre cinque six sept huit neuf dix
run;

proc print
     data=tq84_data;
run;
