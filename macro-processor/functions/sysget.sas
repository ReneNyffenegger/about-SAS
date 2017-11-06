%macro envVar(envVar);
  %put %sysfunc(substr(%str(&envVar        ), 1, 8)) = %sysget(&envVar);
%mend;

%envVar(HOME   )
%envVar(USER   )
%envVar(PATH   )
%envVar(SHELL  )
%envVar(PWD    )
%envVar(SHLVL  )
%envVar(LOGNAME)
