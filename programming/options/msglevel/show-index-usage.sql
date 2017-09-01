/* Use msglevel=I to print index usage into log */
options msglevel=I;

libname tq84_sql 'p:\ath\to\some\directory';

proc datasets 
     library=tq84_sql
     kill;/* Delete all files in the library at once. */
run;

data tq84_sql.english_numbers;
  length num 4. txt $ 10;
  input  num txt;
datalines;
1 one
2 two
3 three
4 four
5 five
6 six
7 seven
8 eight
9 nine
10 ten
run;


data tq84_sql.roman_numbers;
  length num 4. txt $ 10;
  input  num txt;
  /* Note the missing numbers 4, 7 and 8 */
datalines;
1 I
2 II
3 III
5 V
6 VI
9 IX
10 X
run;

%macro left_join_nums;
   proc sql;
     select
       en.num,
       en.txt,
       rm.txt
     from
       tq84_sql.english_numbers en left join
       tq84_sql.roman_numbers   rm on en.num = rm.num
     where
       en.num = 7;
   quit;
%mend left_join_nums;

%macro create_index_nums(tab);
   proc datasets library=tq84_sql;
     modify &tab;
     index create num / unique;
   run;
%mend create_index_nums;

%left_join_nums;

%create_index_nums(english_numbers);

%left_join_nums;
/* Because of 'options msglevel=I', log says:
   INFO: Index num selected for WHERE clause optimization.
*/

%create_index_nums(roman_numbers);

%left_join_nums;
