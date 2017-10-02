data _null_;

  val = 0.1813;
                      /* 1234567890*/
  put val percent8.2; /*  18.13%   */
  put val percent7.2; /*  18.1%    */
  put val percent6.2; /*   18%     */
  put val percent5.2; /*  18%      */
  put val percent4.2; /*  *%       */

run;
