data x_y;
/* drop i; */
   do i=1 to 20;
      x = rand('unif') * 30;
      y = cos(x/20) * (x/9)**2 + rand('norm') * 0.2;
      output;
   end;
run;

options
  pagesize = 30
  linesize = 70 
;

proc plot data=x_y;
  plot y * x;
  title 'Some fancy title...';
run;
/*
   Some fancy title...              14:53 Wednesday, December 6, 2017  79
  
             Plot of y*x.  Legend: A = 1 obs, B = 2 obs, etc.
  
  y |
  3 +
    |
    |                                        A            B
    |                                    A           A      B
    |                                                 AA    A
    |                                A
  2 +
    |
    |                         A  A
    |
    |                      A                                          A
    |                        A
  1 +                     A
    |                                                                 A
    |                  A
    |
    |
    |       A
  0 +
    -+----------+----------+----------+----------+----------+----------+
     0          5         10         15         20         25         30
*/
