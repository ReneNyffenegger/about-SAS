
proc sql;

  create table work.tab (
    foo num,
    bar char(100),
    baz char(100)
  );

  insert into tab
    set foo = 1                    ,
        bar = '123456789 123456879',
        baz = '123456789 123456879';

  insert into tab
    set foo = 2                    ,
        bar = repeat('abcdef'  ,10),
        baz = repeat('ghi'     ,15);

  insert into tab
    set foo = 3                     ,
        bar = repeat('Mnopqr'  , 18),
        baz = repeat('Stuvw '  ,  6);

quit;

proc sql flow = 20;
  select 
    foo,
    bar,
    baz
  from
    work.tab;
quit;

/*
     foo  bar                   baz
----------------------------------------------------
       1  123456789 123456879   123456789 123456879 
       2  abcdefabcdefabcdefab  ghighighighighighigh
          cdefabcdefabcdefabcd  ighighighighighighig
          efabcdefabcdefabcdef  highighi            
          abcdef                                    
       3  MnopqrMnopqrMnopqr    Stuvw Stuvw Stuvw   
          MnopqrMnopqrMnopqr    Stuvw Stuvw         
          MnopqrMnopqrMnopqr    Stuvw Stuvw         
          MnopqrMnopqrMnopqr                        
          MnopqrMnopqrMnopqr                        
          MnopqrMnop         
*/
