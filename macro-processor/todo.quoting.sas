options nomprint;
/*
 
    Problems to be solved:
       Does a semicolon (;) belong to a macro statement or to an ordinary SAS statement?

    str:      The most basic quoting function.
              It hides symbols that could be interpreted by the macro compiler at
              macro compile time. (Such symbols are: semicolon, space ...)
    bquote
    left
    nrstr
    qleft
    nrbquote
    superq

    Macro quoting:
      Applied during compilation: operate against text in code
        - %str
        - %nrstr
      Applied during execution of macro element: operate against resolved values

*/

%let text                  = twenty-two;
%let text_with_comma       = Foo, bar, baz;
%let text_with_paranthesis = Hello (World);
%let text_with_quotes      = He said "hasta la vista";
%let text_with_ampersand   = %bquote(Acme&Co.); /* Use bquote to prevent "Apparent symbolic reference Co not resolved." */
%let text_with_percent     = 42%is not enough;
%let text_with_comment     = this is a /* comment */;

%put         &text_with_quotes;
%put %bquote(&text_with_quotes);


%macro macro_with_one_parameter(param);
  %put macro with one param says: &param;
%mend  macro_with_one_parameter;

   %macro_with_one_parameter(        &text                  );
   %macro_with_one_parameter(        &text_with_paranthesis );
   %macro_with_one_parameter(        &text_with_quotes      );
   %macro_with_one_parameter(        &text_with_ampersand   );
   %macro_with_one_parameter(        &text_with_percent     );
   %macro_with_one_parameter(        &text_with_comment     );
   %macro_with_one_parameter(%bquote(&text_with_comma       )); /* Use bquote to prevent "ERROR: More positional parameters found than defined." */
