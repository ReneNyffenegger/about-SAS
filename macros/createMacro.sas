libname tq84_lib "&tq84_sasDir.tq84_lib";

proc fcmp outlib=tq84_lib.funcs.tq84;
  subroutine tq84_createMacro_F(prog$, name$, params$);
    call execute(cat(
       '%macro ', name, '(', params, ');',
         prog,
       ' %mend;')
    );
  endsub;
run;

options cmplib=tq84_lib.funcs;

%macro tq84_createMacro_M(funcref, params);

   %local macroName;
   %let   macroName = %tq84_createId(tq84_macro_);

   %let   drop_return_value = %sysfunc(tq84_createMacro_F(&funcref, &macroName, &params));

   &macroName

%mend  tq84_createMacro_M;
