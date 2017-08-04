data
ds;  /* Create dataset ds */
  put "before: " _all_;

  input      x;
  inpcount + 1;
  sumx     + x;
  put "after: " _all_;
datalines;
42
99
13
;
/* Output of put:
before: x=. inpcount=0 sumx=0 _ERROR_=0 _N_=1
after: x=42 inpcount=1 sumx=42 _ERROR_=0 _N_=1
before: x=. inpcount=1 sumx=42 _ERROR_=0 _N_=2
after: x=99 inpcount=2 sumx=141 _ERROR_=0 _N_=2
before: x=. inpcount=2 sumx=141 _ERROR_=0 _N_=3
after: x=13 inpcount=3 sumx=154 _ERROR_=0 _N_=3
before: x=. inpcount=3 sumx=154 _ERROR_=0 _N_=4
*/
