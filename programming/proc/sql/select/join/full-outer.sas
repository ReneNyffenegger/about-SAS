data num_english;
     length txt $20.;
     num=1; txt='one'  ; output;
     num=2; txt='two'  ; output;
     num=3; txt='three'; output;
     num=5; txt='five' ; output;
run;

data num_german;
     length txt $20.;
     num=1; txt='eins' ; output;
     num=3; txt='drei' ; output;
     num=4; txt='vier' ; output;
     num=5; txt='fünf' ; output;
run;

proc sql;
  select
    coalesce(en.num, gr.num) as num,
    en.txt as txt_en,
    gr.txt as txt_fr
  from
    num_english en full outer join
    num_german  gr on en.num = gr.num
      /* using(num) -> The using clause is not supported */
    ;
quit;
/*
     num  txt_en                txt_fr
----------------------------------------------------
       1  one                   eins
       2  two
       3  three                 drei
       4                        vier
       5  five                  fünf
*/
