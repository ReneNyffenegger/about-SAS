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
