data tq84_ds;  /* Create dataset ds */
  put "before: " _all_;

  length v1 $26;
  length v2 $17;

  input      num v1 v2;

  inpcount +   1;
  sumx     + num;

  put "after: " _all_;
datalines;
42 foo I-say_hello-world
999 bar-baz computer
1 abcdefghijklmnopqrstuvwxyz screen
;

/* Output of put:
before: v1=  v2=  num=. inpcount=0 sumx=0 _ERROR_=0 _N_=1
after: v1=foo v2=I-say_hello-world num=42 inpcount=1 sumx=42 _ERROR_=0 _N_=1
before: v1=  v2=  num=. inpcount=1 sumx=42 _ERROR_=0 _N_=2
after: v1=bar-baz v2=computer num=999 inpcount=2 sumx=1041 _ERROR_=0 _N_=2
before: v1=  v2=  num=. inpcount=2 sumx=1041 _ERROR_=0 _N_=3
after: v1=abcdefghijklmnopqrstuvwxyz v2=screen num=1 inpcount=3 sumx=1042 _ERROR_=0 _N_=3
before: v1=  v2=  num=. inpcount=3 sumx=1042 _ERROR_=0 _N_=4
*/



proc print data=tq84_ds;
run;
