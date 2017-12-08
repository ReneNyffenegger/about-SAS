data work.numbers_english;
     length txt $10.;
     num = 1; txt = 'one'  ; output;
     num = 2; txt = 'two'  ; output;
     num = 3; txt = 'three'; output;
     num = 4; txt = 'four' ; output;
     num = 5; txt = 'five' ; output;
run;

data work.numbers_german;
     length txt $10.;
     num = 1; txt = 'eins' ; output;
     num = 2; txt = 'zwei' ; output;
     num = 3; txt = 'drei' ; output;
     num = 4; txt = 'vier' ; output;
     num = 5; txt = 'fÃ¼nf' ; output;
run;


proc ds2;
  data translations_2_through_4;
    method run();
      set {
        select
           en.num as num,
           en.txt as num_english,
           gr.txt as num_german
        from
          work.numbers_english en join
          work.numbers_german  gr on en.num = gr.num
        where
          en.num between 2 and 4
      };
    end;
  enddata;
  run;
quit;

proc print data=work.translations_2_through_4; run;

/* Cleanup */
proc datasets library=work;
     delete
       translations_2_through_4
       numbers_english
       numbers_german;
run;
