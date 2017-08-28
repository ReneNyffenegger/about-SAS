data tq84_numbers;
  
  length num  8            
         txt $20.;

  input  num txt;
  
datalines;
1 one
2 two
3 three
4 four
run;
  
proc transpose
     data = tq84_numbers
     out  = tq84_numbers_transposed(
             rename=(
               col1=a
               col2=b
               col3=c
               col4=d
             )
    );
run;

proc print
     data = tq84_numbers_transposed;
run;
