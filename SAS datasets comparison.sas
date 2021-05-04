data baseball (label='1986 Baseball Data');

set sashelp.baseball;

run;


%macro xyz (data1=, data2=);

proc contents data=&data1 out=contents1 noprint;

run;

 
proc contents data=&data2 out=contents2 noprint;

run;


proc compare base=contents1 comp=contents2 listall;

run;


proc freq data=&data1 noprint;

tables team/out=freq1;

run;

 
proc freq data=&data2 noprint;

tables team/out=freq2;

run;


proc compare base=freq1 comp=freq2 listall;

run;

 
proc summary data=&data1 nway noprint;

class team;

var nhits;

output out=summary1(drop=_:) n=n sum=sum;

run;


proc summary data=&data2 nway noprint;

class team;

var nhits;

output out=summary2(drop=_:) n=n sum=sum;

run;


proc compare base=summary1 comp=summary2 listall;

run;

 
%mend xyz;


options mprint;

%xyz (data1=sashelp.baseball, data2=baseball);


/*

%let data1 = sashelp.baseball;

%let data2 = baseball;

*/
