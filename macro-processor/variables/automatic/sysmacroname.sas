%macro tq84_bar;
  %put bar: sysmacroname = &sysmacroname;
%mend;

%macro tq84_foo;
  %put foo: sysmacroname = &sysmacroname;
  %tq84_bar;
%mend;

%tq84_foo
/*
foo: sysmacroname = TQ84_FOO
bar: sysmacroname = TQ84_BAR
*/
