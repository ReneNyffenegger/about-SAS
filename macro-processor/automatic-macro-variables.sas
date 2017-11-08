%macro p(id);
  * put "&id = " &&&id;
  %put "&id = " &&&id;
%mend p;



DATA _null_;
  %p(_CLIENTAPP);
  %p(_CLIENTMACHINE);

  %p(_CLIENTPROJECTNAME);
  %p(_CLIENTPROJECTPATH);

  %p(_CLIENTTASKFILTER);
  %p(_CLIENTTASKLABEL);

  %p(_CLIENTUSERID); 
  %p(_CLIENTUSERNAME);
 
  %p(_SASHOSTNAME);
  %p(_SASPROGRAMFILE);
  %p(_SASSERVERNAME);

  %p(SYSADDRBITS);
  %p(SYSBUFFR);
  %p(SYSCC);
  %p(SYSCHARWIDTH);
  %p(SYSCMD);
  %p(SYSDATE);
  %P(SYSDATE9);
  %p(SYSDAY);
  %p(SYSDEVIC);
  %p(SYSDMG);
  %p(SYSDSN);
  %p(SYSENCODING);
  %p(SYSENDIAN);
  %p(SYSENV);
  %p(SYSERR);
  %p(SYSERRORTEXT);
  %p(SYSFILRC);
  %p(SYSHOSTNAME);
  %p(SYSINDEX);
  %p(SYSINFO);
  %p(SYSJOBID);          /* The PID (process identifier) of the unix process */
  %p(SYSLAST);
  %p(SYSLCKRC);
  %p(SYSLIBRC);
  %p(SYSLOGAPPLNAME);
  %p(SYSMACRONAME);
  %p(SYSMENV);
  %p(SYSMSG);
  %p(SYSNCPU);
  %p(SYSNOBS);
  %p(SYSODSESCAPECHAR);
  %p(SYSODSPATH);
  %p(SYSPARM);
  %p(SYSPBUFF);
  %p(SYSPROCESSID);
  %p(SYSPROCESSNAME);
  %p(SYSPROCNAME);
  %p(SYSRC);
  %p(SYSSCP);
  %p(SYSSCPL);
  %p(SYSSITE);
  %p(SYSSIZEOFLONG);
  %p(SYSSIZEOFPTR);
  %p(SYSSIZEOFUNICODE);
  %p(SYSSTARTID);
  %p(SYSSTARTNAME);
  %p(SYSTCPIPHOSTNAME);
  %p(SYSTIME);
  %p(SYSUSERID);
  %p(SYSVER);
  %p(SYSVLONG);
  %p(SYSVLONG4);
  %p(SYSWARNINGTEXT);

run;
