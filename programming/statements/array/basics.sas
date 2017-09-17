data _null_;

    array ary[3] foo bar baz;

    foo =  42;
    bar = 999;
    baz =   7;

    do i = 1 to dim(ary);
       ary[i] = ary[i]+i;
       put ary[i]=;

    /*  The loop prints:
          foo=43
          bar=1001
          baz=10

       NOTE although the put statement uses ary[i], the
       actual printed variable name are the underlying
       foo, bar and baz.

    */
    end;

    put "Changed value of foo = " foo;
    put "Changed value of bar = " bar;
    put "Changed value of baz = " baz;

/*
    The above puts print:
      Changed value of foo = 43
      Changed value of bar = 1001
      Changed value of baz = 10

    Again, the assignement to ary[i] in the do loop have
    changed the underlying variables.
*/
    
run;
