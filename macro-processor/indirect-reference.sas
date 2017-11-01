%let fourty_two = 42;
%let number     = fourty_two;

%put The number &number is  &&number; /* The number fourty_two is  fourty_two */
%put The number &number is &&&number; /* The number fourty_two is 42          */

* ------------------- ;

%let germanone=eins;
%let germantwo=zwei;
%let germanthree=zwei;

%let frenchone=un;
%let frenchtwo=deux;
%let frenchthree=trois;

%let lang=french;
%let num=two;

%put In &lang, &num is &&&lang&num; /* In french, two is deux */
