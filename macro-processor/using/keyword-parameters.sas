%macro m_tq84(param_1, param_2 = ParamTwo, param_3 = spaces are allowed);
  %put &=param_1;
  %put &=param_2;
  %put &=param_3;
%mend;

%m_tq84(one);
/*
     PARAM_1=one
     PARAM_2=ParamTwo
     PARAM_3=spaces are allowed
*/
%m_tq84(three, param_3 = def);
/*
     PARAM_1=three
     PARAM_2=ParamTwo
     PARAM_3=def
*/
