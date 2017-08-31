/* 
    %let creates a macro variable and assigns a
    value to it.
    
    The macro variable is then resolved by putting an
    ampersand in its front.
*/

%let   answer=forty-two;
%put  &answer;
%put '&answer'   /* Within '...', the macro variable is not expanded */;
%put "&answer"   /* Within "...", the macro variable is expanded     */;

/* Note that the "&variable" construct turns the datatyp into CHAR: */
%let tq84_num=42;
%put %datatyp( &tq84_num ); /* NUMERIC */
%put %datatyp("&tq84_num"); /* CHAR    */
