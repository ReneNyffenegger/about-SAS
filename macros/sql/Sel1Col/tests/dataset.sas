
data tq84_dir_sel_test;
     col_one = 'abc'; col_two = 42; col_three = '28aug17'd; output;
     col_one = 'def'; col_two = 99; col_three = '13sep13'd; output;
     col_one = 'ghi'; col_two = -1; col_three = '15oct15'd; output;
run;


%let col_names = %tq84_sqlDataSetSel1Col(
       select
         name
       from
         dictionary.columns
       where
         libname = 'WORK' and
         memname = 'TQ84_DIR_SEL_TEST'
   );

%put col_names = &col_names; /* col_names = col_one col_two col_three */

%let col_names_array  = %tq84_array(&col_names);
%tq84_arrayApply(&col_names_array, %nrstr(
  %put value = &this;
))
