filename pw 'p:\ath\to\file\to\create\password';

proc pwencode
     in  = 'secretGarden'
/*   
     Use the out option to write the encoded password
     into a file.
     Without the out option, pwencode would write
       {SAS002}5D71C73D177DE3AB1488316D52BDEBDE1ADDF998
     into the log.

    {SAS002} is the key needed to decode the encoded
     password back into the original password.        */
     out =  pw;
run;

data _null_;

   infile pw truncover;
   input  pw_line :$50.;

/* Read the encoded password into a macro variable: */
   call symputx('pwd', pw_line);
run;

%put Encoded password is &pwd;
