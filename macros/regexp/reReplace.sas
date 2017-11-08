%macro tq84_reReplace(src, pat, repl);
  %sysfunc(prxchange(s/&pat/&repl/, -1, &src))
%mend  tq84_reReplace;
