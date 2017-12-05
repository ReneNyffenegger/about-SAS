%let dest=/tmp/tq84.txt;
%let cmd=echo abc def ghi>&dest;

systask command "&cmd"       wait;
systask command "cat &dest"  wait;
/* cat: /tmp/tq84.txt: No such file or directory */

systask command "bash -c '&cmd'" wait;
systask command "cat &dest"      wait;
/* > abc def thi */

systask command "rm &dest"       wait;
systask command "&cmd"           wait shell='bash';
systask command "cat &dest"      wait;
/* > abc def thi */
