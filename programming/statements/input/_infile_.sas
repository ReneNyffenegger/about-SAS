data tq84_ts; 

 infile datalines;

 /* Dont assign any value to any variable: */
 input;
 
 /* _infile_ apparently stores the last read line */
 put _n_ : _infile_;
 
datalines;
Lorem ipsum dolor sit amet, consetetur
sadipscing elitr, sed diam nonumy eirmod
tempor invidunt ut labore et dolore
magna aliquyam erat, sed diam voluptua.
At vero eos et accusam et justo duo
dolores et ea rebum.
;

proc print data=tq84_ts;
run;
