%macro tq84_bool(expr);

  %if &expr
  %then %put >&expr< is true;
  %else %put >&expr< is false;

%mend tq84_bool;


%tq84_bool(        0    );   /*  >0< is false         */
%tq84_bool(        1    );   /*  >1< is true          */
%tq84_bool(        1-1  );   /*  >1-1< is false       */
%tq84_bool(        1+1  );   /*  >1+1< is true        */
%tq84_bool(%nrstr(  0  ));   /*  >  0  < is false     */
%tq84_bool(%nrstr(  1  ));   /*  >  1  < is true      */
%tq84_bool(  abc > def  );   /*  >abc > def< is false */
%tq84_bool(  abc eq abc );   /*  >abc eq abc< is true */
