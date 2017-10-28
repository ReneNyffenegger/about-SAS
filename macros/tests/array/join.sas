%let fooBarBaz = %tq84_array(foo bar baz);

%put %tq84_arrayJoin(&fooBarBaz);                  /* foo bar baz */
%put %tq84_arrayJoin(&fooBarBaz, delim=%str( - )); /* foo - bar - baz */
