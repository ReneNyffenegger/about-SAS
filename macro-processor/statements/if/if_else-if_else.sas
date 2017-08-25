%macro num_to_foo_bar_baz(num);

  %if       &num eq 1 %then 'foo';
  %else %if &num eq 2 %then 'bar';
  %else                     'baz';

%mend num_to_foo_bar_baz;

%put %num_to_foo_bar_baz(1);
%put %num_to_foo_bar_baz(2);
%put %num_to_foo_bar_baz(3);
