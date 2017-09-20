%macro connect_lib(nam, path);

  libname &nam "&path";
  %if &syslibrc ne 0
      %then %put "Could not connect to &path";
      %else %put "Successfully connect &nam to %path";

%mend conect_lib;

%connect_lib(lib_one, %str(p:\ath\to\a\directory));
%connect_lib(lib_two, %str(c:\does\not\exist));

libname lib_one clear;
