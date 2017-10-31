%let portnr   =  7551;
%let host     =  win.renenyffenegger.ch;
%let tq84_srv =  &host &portnr;

%let user     =  DOMAIN\rene;
%let password = {SAS002}.......;

options remote              = tq84_srv /* tq84_srv is the name of a macro variable */
        comamid             = tcp
        netencrypt
        netencryptalgorithm = aes
;

signon tq84_srv   /* tq84_srv is the name of a macro variable */
       noscript
       user     = "&user"
       password = "&password"
;


%syslput tq84_path_from = \\some.server\Share$\path\to\a\directory;
%syslput tq84_path_to   = %nrquote(/home/rene); /* use nrquote because of the forward slashes */
%syslput tq84_filename  = foo.txt;
   
rsubmit;
   proc download
        infile  = "&tq84_path_from\&tq84_filename"
        outfile = "&tq84_path_to/&tq84_filename"
        binary;
   run;
endrsubmit;

signoff;
