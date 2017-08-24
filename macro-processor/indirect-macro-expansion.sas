%macro foo;
  this is from macro foo
%mend foo;

%macro bar;
  this is from macro bar
%mend bar;

%macro put_named_macro(macro_name);
  %put macro &macro_name expands to >%&macro_name<;
%mend put_named_macro;

%put_named_macro(foo);
