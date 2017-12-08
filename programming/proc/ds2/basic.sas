data work.tq84_ds;
  foo = 'The foo,';
  bar = 'the bar';
  baz = 'and the baz.';
  output;
  foo = 'one';
  bar = 'two';
  baz = 'three';
  output;
run;


proc ds2;
  data _null_;
    method init();
      dcl varchar(16) someMessage;
      someMessage = 'Starting...';
      put someMessage;
    end;
    method run();
      set work.tq84_ds;
      put foo bar baz;
    end;
    method term();
      put 'Finished!';
    end;
  enddata;
  run;
quit;
