data xlsx;
     col_one   = 'foo';
     col_two   =  42;
     col_three = 'Hello world';
     output;
     col_one   = 'bar';
     col_two   =  99;
     col_three = 'Nice to meet you';
     output;
     col_one   = 'baz';
     col_two   =  -1;
     col_three = 'Good bye';
     output;
run;
     
ods excel
    file='/share/home/tq84/basic.xlsx'
    options (sheet_name = 'Name game');

proc print data = xlsx; run;

ods excel close;
