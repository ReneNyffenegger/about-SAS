proc fcmp outlib=work.funcs.tq84;

  function returnChar(text$) $ 100; /* $ indicates that char type is returned */
       return(cat(text, '-', text));
  endsub;
run;

%put returned text is: %sysfunc(returnChar(hello)); /* returned text is: hello-hello */
