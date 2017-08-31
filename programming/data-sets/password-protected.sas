data pw_protected (
        write=pw_w
        read =pw_r
        alter=pw_a
     );

  x='eggs';
  y='why' ;
  z= 42   ;

  output;

run;


data cp_pw_protected;
  set pw_protected(pw=pw_r);
run;

proc sql;
  select * from pw_protected(pw=pw_r);
run;

proc sql;
  select * from cp_pw_protected;
run;

proc sql;
  update pw_protected(pw=pw_w)
  set z = z*2;
quit;
