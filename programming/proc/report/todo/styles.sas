data tq84_rep;
     input col_1 $  1-11
           col_2 $ 13-21
           val_1   23-30;

datalines;
group one  |foo      |  42.10
group one  |bar      |   7.00
group one  |baz      |   5.99
group two  |abc def  |  18.1:2
group two  |gh jklmno|   0.10
group three|pqr      | 222.18
group three|stu vwx  |  73.37
run;

ods html body = '/share/home/tq84/report/body.html';

proc report nowd data=tq84_rep

     style(report ) = [background  = green
                       cellspacing = 10
                       rules       = rows
                       bordercolor = cxf03333
                       borderwidth = 3
                       frame       = box       /* above, below, box, hsides, vsides, lhs, rhs, void ??? */
                      ]

     style(column ) = [background  = yellow
                       font_weight = bold      /* medium, bold, light */
                       font_style  = italic    /* roman, italic */
                      ]

     style(header ) = [background  = pink     
                       font_size   = 30px
                       font_face   = Garamond
                       font_style  = roman
                       cellheight  = 100px      /* ??? */
                      ]

     style(summary) = [background  = lightblue
                       font_face   ='Courier New'
                       font_width  = wide         /* compressed, narrow, wide */
                      ]

     style(lines  ) = [background  = cxD7EAFF
                       bordercolor = cxF03761
                       font        =(Verdana, 4, bold italic)
                      ]

     style(calldef) = [background  = purple   ];

     column col_1 col_2 val_1;

     define col_1 / order   'Group';
     define col_2 / display 'Text' ;
     define val_1 / display 'Value';

     break after col_1 / summarize;

%macro NOTHING;
     compute after col_1;
     /* Inside a compute block, call define statements can be used
        to change style attributes */
        if val_1.sum > 100 then
           call define(
               'val_1.sum', /* column id                           */
               'style',     /* attribute name style, url or format */
               'style=[background=orange font_weight=bold]') /* value */
           ; 
    
     endcomp;
%mend;

     /*
     compute after col_1;
       name = 'Total';
       line ' ddd';
     endcomp;
     */

run;

ods html close;
