data tq84_data;

  length num    8
         en  $ 10
         fr  $ 10
         gr  $ 10;

  input  num en fr gr;

datalines;
1 one    un     eins
2 two    deux   zwei
3 three  trois  drei
4 four   .      vier
5 five   cinque fünf
6 six    .      .
7 seven  .      sieben
8 eight  huit   .
9 nine   neuf   neun
10 ten   dix    yehn
run;

proc sql;

/*
    nmiss(col) counts thes missing values
    in col.

    missing(col) is 1 if value is missing
    and 0 otherwise.
    So sum(missing(col)) = nmiss(col)
*/

  select
    count(* ) as cnt,
 /* ---- */
    count      (en)  as en_cnt,
    nmiss      (en)  as en_mis,
    sum(missing(en)) as en_smm,
 /* ---- */
    count      (fr)  as fr_cnt,
    nmiss      (fr)  as fr_mis,
    sum(missing(fr)) as fr_smm,
 /* ---- */
    count      (gr)  as gr_cnt,
    nmiss      (gr)  as gr_mis,
    sum(missing(gr)) as gr_smm
  from
    tq84_data;

quit;
