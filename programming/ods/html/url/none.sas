ods listing close;
ods html path='/share/home/tq84/sas/ods/html' (url=none)
         body='gchart.html';
goptions reset=all;

proc gchart data=sashelp.class;
     hbar age / discrete
     name="graph"      /* Names the created graphic (without suffix) -> graph.png will be created */
;
run;
quit;
/* Since we specified url=none, the image will be referenced
   without a path:
     <img … src="graph.png" …>
*/

ods html close;
ods listing;
