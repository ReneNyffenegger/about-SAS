/* 
    %let creates a macro variable and assigns a
    value to it.
*/

%let   answer=forty-two;
%put  &answer;
%put '&answer'   /* Within '...', the macro variable is not expanded */;
%put "&answer"   /* Within "...", the macro variable is expanded     */;
