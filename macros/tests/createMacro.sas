%macro tq84_call_n_times(funcref, times);

    %local macroName;
    %let   macroName = %tq84_createMacro_M(&funcref, n);
   
    %local i;
    %do i = 1 %to &times;
        %&macroName(&i)
    %end;

%mend  tq84_call_n_times;


%tq84_call_n_times(%nrstr(
   %put &n*&n = %eval(&n * &n);),
   10
)
/*
1*1 = 1
2*2 = 4
3*3 = 9
4*4 = 16
5*5 = 25
6*6 = 36
7*7 = 49
8*8 = 64
9*9 = 81
10*10 = 100
*/

%tq84_call_n_times(%nrstr(
  %if &n = 5
  %then %put FIVE !;
  %else %put n = &n;
  ),
  10
)
/*
n = 1
n = 2
n = 3
n = 4
FIVE !
n = 6
n = 7
n = 8
n = 9
n = 10
*/

%tq84_call_n_times(%nrstr(

  %local n_outer;
  %let   n_outer = &n;
  
  %tq84_call_n_times(%nrstr(
      %put n_outer = &n_outer | n inner = &n;
  ), &n)

), 6)
/*
n_outer = 1 | n inner = 1
n_outer = 2 | n inner = 1
n_outer = 2 | n inner = 2
n_outer = 3 | n inner = 1
n_outer = 3 | n inner = 2
n_outer = 3 | n inner = 3
n_outer = 4 | n inner = 1
n_outer = 4 | n inner = 2
n_outer = 4 | n inner = 3
n_outer = 4 | n inner = 4
n_outer = 5 | n inner = 1
n_outer = 5 | n inner = 2
n_outer = 5 | n inner = 3
n_outer = 5 | n inner = 4
n_outer = 5 | n inner = 5
n_outer = 6 | n inner = 1
n_outer = 6 | n inner = 2
n_outer = 6 | n inner = 3
n_outer = 6 | n inner = 4
n_outer = 6 | n inner = 5
n_outer = 6 | n inner = 6
*/
