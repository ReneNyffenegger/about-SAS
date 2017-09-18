%let server   = server.renenyffenegger.ch;
%let port     = 5105;
%let logonid  = &sysuserid;
%let password = {SAS002}5D71C73D177DE3AB1488316D52BDEBDE1ADDF998; /* Use proc pwencode to determine password */;

%let tq84_srv=&server. &port.;

options comamid = tcp; /* Connect to server via TCP/IP */
options netencrypt
        netencryptalgorithm = SASProprietary;

signon
  tq84_srv
  noscript                 /* Don't use a SAS/CONNECT script to sign/in */
  user     =  &logonid
  password = "&password"
;

/* Use %SYSLPUT to create macro variables in the server session.
   This can be used to pass values (parameters) from the client
   to the server.

   %syslput has a /REMOTE option. Therefore, values
   with a forward slash should be quoted with %BQUOTE(). */
%syslput param_1 = The client runs on &syshostname;
%syslput param_2 = %bquote(bar/baz);

rsubmit;
   %put param_1 = &param_1;
   %put param_2 = &param_2;

/* Use %SYSRPUT to create macro variables in the client session.
   This can be used to pass values (return codes etc.) from the
   server session to the client: */
   %sysrput return_val_1 = The server runs on &syshostname;
   %sysrput return_val_2 = two;
endrsubmit;

signoff;

%put return_val_1 = &return_val_1;
%put return_val_2 = &return_val_2;
