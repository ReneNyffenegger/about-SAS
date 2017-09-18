/* Ian Whitlock: A Serious Look Macro Quoting 

   http://www2.sas.com/proceedings/sugi28/011-28.pdf

*/

%let v_semicolon = %str(;);

%put v_semicolon >&v_semicolon<; /* semicolon >;< */


/*   The following put is executed in
     OPEN CODE and throws the following error:

     ERROR 180-322: Statement is not valid or
           it is used out of proper order.

     This is because the line is interpreted as
     %put %upcase(semicolon >;<);
*/
%put %upcase(v_semicolon >&v_semicolon<);

/*  However, with %qupcase instead of %upcase, the
    put can be made: */
%put %qupcase(v_semicolon >&v_semicolon<);



%macro m_semicolon;
  %local l_semicolon;
  %let l_semicolon = %str(;);

  %put %upcase(l_semicolon >&l_semicolon<);
%mend m_semicolon;

/* This works! Apparently because the %put
   is executed in CLOSED CODE.*/
%m_semicolon;
