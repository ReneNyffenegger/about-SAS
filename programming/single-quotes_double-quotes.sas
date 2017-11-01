%put it''s rainy!; /* it''s rainy! */
/* NOTE 49-169: The meaning of an identifier after a quoted string might change in a future SAS release.  Inserting white space 
                between a quoted string and the succeeding identifier is recommended. */


%put it%str('')s rainy!; /* it''s rainy! */

%let weather = it''s rainy;
%put weather: &weather; /* weather: it''s rainy */

data _null_;
  put 'It''s rainy'         ; /* It's rainy         */
  put "It's sunny"          ; /* It's sunny         */
  put "He said ""she said"""; /* He said "she said" */
  put 'She said "he said"'  ; /* She said "he said" */
run;
