data tq84_data;
   input category$ val_1 val_2;
datalines;
foo  1   4
foo  2   3
bar  4   2
foo  3   1
bar 10   2
baz 19   3
baz 21   4
;

ods tagsets.ExcelXP
    file = 'P:\ath\to\file.xml'
    style=  statistical
    options(
      embedded_titles = 'yes'
      sheet_name      = 'ODS Test'
    );

    title 'ods test';

    proc sql;
      select
        category,
        val_1,
        val_2
      from
        tq84_data;
    quit;

ods tagsets.ExcelXP close;
