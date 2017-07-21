/*
    In a macro statement, character strings need not
    be enclosed in quotation marks. 
*/

%let  text=The foo, the bar and the baz.;
%put &text;
