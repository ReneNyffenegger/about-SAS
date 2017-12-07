data nums_and_chars;
  num_one   =  42 ;
  chr_two   ='foo';
  num_three =  99 ;
  num_four  =  -1 ;
  num_five  =   . ;
  chr_six   ='bar';
  chr_seven ='baz';
  output;
run;

/* Print variables with numeric type: */
proc print
     data = nums_and_chars;
     var    _numeric_;
run;
/*
                     num_
  Obs    num_one    three    num_four    num_five
  
   1        42        99        -1           .   
*/

/* Print variables with charact type: */
proc print
     data = nums_and_chars;
     var    _char_;
run;
/*
                               chr_
  Obs    chr_two    chr_six    seven
  
   1       foo        bar       baz 
*/
