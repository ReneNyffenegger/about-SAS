%include "&tq84_macrosRoot.createMacro.sas";
%include "&tq84_macrosRoot.regexp/reReplace.sas";
%include "&tq84_macrosRoot.log/redirectLog.sas";

%tq84_redirectLog(/share/home/tq84/sasLog)

%include "&tq84_macrosRoot.createId.sas";
%include "&tq84_macrosRoot.array.sas";
%include "&tq84_macrosRoot.sql/Sel1Col/dataset.sas";
%include "&tq84_macrosRoot.sql/Sel1Col/dbms.sas";
%include "&tq84_macrosRoot.members.sas";
