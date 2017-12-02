%let cmd=ls /tmp;
x &cmd;
%put &cmd returned &sysrc;
/* ls /tmp returned 0 */

%let cmd=ls /non/existing/directory;
x &cmd;
%put &cmd returned &sysrc;
/* ls /non/existing/directory returned 2 */
