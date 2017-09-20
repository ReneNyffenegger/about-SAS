%macro m_tq84(
     param_1,
     param_2,
     param_3 = ParamThree,
     param_4 = param four: params are allowed
  );
  %put &=param_1;
  %put &=param_2;
  %put &=param_3;
  %put &=param_4;
%mend;

/* Using the macro without parantheses: */
%m_tq84;
/*
   PARAM_1=
   PARAM_2=
   PARAM_3=ParamThree
   PARAM_4=param four: params are allowed

   -------------------------------------- 

   Using the macro without any parameters */
%m_tq84();
/*
   PARAM_1=
   PARAM_2=
   PARAM_3=ParamThree
   PARAM_4=param four: params are allowed

   -------------------------------------- 

   Using the named parameter:              */
%m_tq84(three, param_4 = def);
/*
   PARAM_1=three
   PARAM_2=
   PARAM_3=ParamThree
   PARAM_4=def
*/
