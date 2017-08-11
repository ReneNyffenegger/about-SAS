data tq84_data;
   length num $ 20;

   input  num $
          val;

datalines;
one 1
two 2
three 3
four 4
five 5
six 6
seven 7
eight 8
nine 9
ten 10
eleven 11
twelve 12
thirteen 13
fourteen 14
fivteen 15
sixteen 16
seventeen 17
eighteen 18
nineteen 19
twenty 20
;


data tq84_filtered;
  
  set tq84_data(
      where=(num between 's' and 'u')
  );
   
  output;
run;

proc print data=tq84_filtered;
run;
