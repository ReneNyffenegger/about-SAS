ods listing close;
ods html path='/share/home/tq84/sas/ods/html' 
        gpath='/share/home/tq84/sas/ods/html/img' (url='img/') /* url specifies the relative path of the created graphic */
         body='gchart2.html';
goptions reset=all;

proc gchart data=sashelp.class;
     hbar age / discrete
     name="graph2"      /* Names graphic without suffix -> img/graph2.png will be created */
;
run;
quit;
/* Since we specified url=img/, the image will be referenced
   with a prefixing it by that url:
     <img … src="img/graph2.png" …>
*/

ods html close;
ods listing;
