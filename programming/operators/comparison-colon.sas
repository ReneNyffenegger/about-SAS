data tq84_data_in;

  input txt $3.;

datalines;
A
AB
ABC
D
DE
DEF
G
GH
GHI
run;


data tq84_data_out;
  set tq84_data_in;
 
  if txt =    'A'         then A_eq_A           = "txt = 'A'";
                          else A_eq_A           = "";
 
  if txt =:   'A'         then A_eq_colon_A     = "txt =: 'A'";
                          else A_eq_colon_A     = "";

  if txt =:   'AB'        then A_eq_colon_AB    = "txt =: 'AB'";
                          else A_eq_colon_AB    = "";

  if txt >=:  'AB'        then A_gt_colon_AB    = "txt >: 'AB'";
                          else A_gt_colon_AB    = "";

  if txt in  ('AB', 'DE') then A_in_AB_DE       = "txt in ('AB', 'DE')";
                          else A_in_AB_DE       = "";

  if txt in: ('AB', 'DE') then A_in_colon_AB_DE = "txt in: ('AB', 'DE')";
                          else A_in_colon_AB_DE = "";
 
run;
