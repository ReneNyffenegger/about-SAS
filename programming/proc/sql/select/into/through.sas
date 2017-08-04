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
    :val_3         through :val_7,
    :german_name_3 through :german_name_7
  from
    tq84_num_translation
  where
    lang eq 'en' and
    val between 3 and 7;
quit;

/* A macro variable is created for every record in the select statement */
%put vals: &val_3 &val_4 &val_5 &val_6 &val_7;
%put German names: &german_name_3 &german_name_4 &german_name_5 &german_name_6 &german_name_7;
