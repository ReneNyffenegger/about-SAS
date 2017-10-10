data _null_;

     text  = 'foo bar baz';
     a2AAA = tranwrd(text, 'a', ' AAA '); 
     ba2BA = tranwrd(text, 'ba', 'BA'  );  

     put a2AAA=; /* a2AAA=foo b AAA r b AAA z */
     put ba2BA=; /* ba2BA=foo BAr BAz         */

run;
