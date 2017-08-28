data tq84_nums;
   length val
          txt $20;
   input  val txt;
datalines;
1 one
2 two
3 three
4 four
5 five
6 six
run;

data tq84_last_num;
   set tq84_nums end=tq84_last;;

   if tq84_last;
run;
