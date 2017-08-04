data tq84_num_translation;

  input
    val     1- 2
    nam  $  4- 9
    lang $ 11-12
  ;

datalines;
 1 one    en
 2 two    en
 3 three  en
 4 four   en
 5 five   en
 6 six    en
 7 seven  en
 8 eight  en
 9 nine   en
 1 eins   ge
 2 zwei   ge
 3 drei   ge
 4 vier   ge
 5 fünf   ge
 6 sechs  ge
 7 sieben ge
 8 acht   ge
 9 neun   ge
;

proc sql;
  select
    val,
    nam
  into
    :vals         seperated by ' ',
    :german_names separated by ','
  from
    tq84_num_translation
  where
    lang eq 'en' and
    val between 3 and 7;
quit;



%put Values: &vals;
%put German names: &german_names;
