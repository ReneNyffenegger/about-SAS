data _null_;

   numbers = 'foo bar baz 42';

   regexpId = prxparse('/(\w+) (\w+) (\w+) (\w+)/');

   pos = prxmatch(regexpId, numbers);

   if pos > 0 then do;

      do paranNo = 1 to 4;

         call prxposn(regexpId, paranNo, txtStart, txtEnd);
         txtMatched = substr(numbers, txtStart, txtEnd);
         put "paranthesis " paranNo ": " txtMatched; 
      end;
   end;

run;
/*
paranthesis 1 : foo
paranthesis 2 : bar
paranthesis 3 : baz
paranthesis 4 : 42
*/
