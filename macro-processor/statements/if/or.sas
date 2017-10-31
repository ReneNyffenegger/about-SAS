%macro isFooBarOrBaz(txt);

  %if %upcase(&txt) eq FOO or
      %upcase(&txt) eq BAR or
      %upcase(&txt) eq BAZ %then

      yes

  %else

      no
  
%mend;

%put %isFooBarOrBaz(Bar);  /* yes */
%put %isFooBarOrBaz(xyz);  /* no  */
%put %isFooBarOrBaz(BAZ);  /* yes */
