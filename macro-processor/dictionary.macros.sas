%let tq84_macro_var = Hello world;

proc sql;
  select
    scope,  /* GLOBAL, LOCAL ?...         */
    offset, /* Offset into macro variable */
    value
  from
    dictionary.macros
  where
    name = 'TQ84_MACRO_VAR';
quit;
