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

proc sql _method;
  select
    en.num,
    en.txt,
    rm.txt
  from
    tq84_sql.english_numbers en left join
    tq84_sql.roman_numbers   rm on en.num = rm.num
  order by
    en.txt;
quit;
/*
sqxslct
    sqxsort
        sqxjm
            sqxsort
                sqxsrc( TQ84_SQL.ROMAN_NUMBERS(alias = RM) )
            sqxsort
                sqxsrc( TQ84_SQL.ENGLISH_NUMBERS(alias = EN) )
*/
