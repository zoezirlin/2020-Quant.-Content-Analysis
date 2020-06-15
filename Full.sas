/*
README Key
- "Thesis" dataset: XLXS dataset, cleaned up previously directly in excel, contains the presence or absence of traits belonging to seven
categories which have not yet been assigned or labelled
- "Thesis_Full_50_Tests" dataset: if certain trait "QX" is present, (If 'Yes'->Then TropeX= 'Present') then the category to which that
trait belongs is marked as present
*/



/*What it does: imports the xlsx file "COMPLETE_POSTERS_JAN26"*/
PROC IMPORT DATAFILE="/home/u42893137/ZZ/Feb22!.xlsx"
		    OUT=Thesis
		    DBMS=XLSX
		    REPLACE;
RUN;

/*What it does: prints the first 15 observations of the thesis xlsx dataset*/
PROC PRINT DATA=Thesis (obs=15); RUN;

/*What it does: constructs algorithm to gather every poster's data, looks at each question responses for a poster, 
assigns the binary presence or absence of the correlated trope to the survey answer*/
DATA Thesis_Full_50_Tests;
	SET Thesis;
IF Q10_1 = 'Yes' THEN TROPE4='Present';
IF Q11 = 'Hitler is staring at the right of the viewer' or 'Yes'  THEN TROPE4= 'Present';
IF Q11 = 'Hitler is staring at the left of the viewer' or 'Yes'  THEN TROPE4= 'Present';
IF Q11 = 'Hitler is staring directly at the viewer' or 'Yes'  THEN TROPE4= 'Present';
IF Q12 = 'Hitlers whole body is depicted' or 'Yes' THEN TROPE4 = 'Present'; /*take apostrophe out of answer choice*/
IF Q12 = 'Hitlers upper half of body is depicted' or 'Yes'  THEN TROPE4= 'Present'; /*take apostrophe out of answer choice*/
IF Q12 = 'Hitlers head is suspended in midair' or 'Yes'  THEN TROPE4= 'Present'; /*take apostrophe out of answer choice*/
IF Q48 = 'Hitler is sitting' or 'Yes'  THEN TROPE4= 'Present';
IF Q48 = 'Hitler is standing' or 'Yes'  THEN TROPE4= 'Present'; /*This is incorrect in survey fix it*/
IF Q13 = 'Hitler is alone' or 'Yes'  THEN TROPE4= 'Present';
IF Q13 = 'Hitler is with group of 1-6 people' or 'Yes'  THEN TROPE4= 'Present'; /*Fix to include 1 other person as it is in this code*/
IF Q13 = 'Hitler is with group of 7-15 people' or 'Yes'  THEN TROPE4= 'Present';
IF Q13 = 'Hitler is with group of 16+ people' or 'Yes'  THEN TROPE4= 'Present';
IF Q14 = 'Hitler is holding a sword' or 'Yes'  THEN TROPE4 = 'Present';
IF Q14 = 'Hitler is holding a flag' or 'Yes'  THEN TROPE4 = 'Present';
IF Q18 = 'Man is wearing a Jewish star depicted somewhere on his body 
(not in the form of a necklace)' or 'Yes'  THEN TROPE2= 'Present';
IF Q18 = 'Man is wearing a Jewish star in the form of a necklace' or 'Yes'  THEN TROPE2= 'Present';
IF Q56_1 = 'Yes' THEN TROPE2= 'Present';
IF Q54_1 = 'Yes' THEN TROPE2 = 'Present';
IF Q19_1 = 'Yes' THEN TROPE3 = 'Present'; /*INBORN DIGNITY*/
IF Q55_1 = 'Yes' THEN TROPE2 = 'Present';
IF Q53_1 = 'Yes' THEN TROPE2 = 'Present';
IF Q21 = 'Man is holding a flag' or 'Yes'  THEN TROPE5 = 'Present'; /*GEOGRAPHIC MATERIALIZATION*/
IF Q21 = 'Man is holding a shovel' or 'Yes'  THEN TROPE6 = 'Present'; /*SYMBOLIC REBIRTH*/
IF Q21 = 'Man is holding a drum' or 'Yes'  THEN TROPE3 = 'Present'; /*INBORN DIGNITY*/
IF Q24 = 'Boy is wearing Hitler-Youth Uniform' or 'Yes'  THEN TROPE3 = 'Present'; /*INBORN DIGNITY*/
IF Q24 = 'Boy is wearing denim' or 'Yes'  THEN TROPE6 = 'Present'; /*SYMBOLIC REBIRTH*/
IF Q58_1 = 'Yes' THEN TROPE3 = 'Present'; /*INBORN DIGNITY*/
IF Q27 = 'Boy is holding a flag' or 'Yes'  THEN TROPE5 = 'Present'; /*GEOGRAPHIC MATERIALIZATION*/
IF Q27 = 'Boy is holding a shovel' or 'Yes'  THEN TROPE6 = 'Present'; /*SYMBOLIC REBIRTH*/
IF Q27 = 'Boy is holding a hammer' or 'Yes'  THEN TROPE6 = 'Present'; /*SYMBOLIC REBIRTH*/
IF Q27 = 'Boy is holding a drum' or 'Yes'  THEN TROPE3 = 'Present'; /*INBORN DIGNITY*/
IF Q31 = 'Woman is holding a baby' or 'Yes'  THEN TROPE3= 'Present'; /*INBORN DIGNITY*/
IF Q31 = 'Woman is holding a flag' or 'Yes'  THEN TROPE5 = 'Present'; /*GEOGRAPHIC MATERIALIZATION*/
IF Q31 = 'Woman is holding a hammer' or 'Yes'  THEN TROPE6 = 'Present'; /*SYMBOLIC REBIRTH*/
IF Q31 = 'Woman is holding a childrens toy' or 'Yes'  THEN TROPE3 = 'Present'; /*INBORN DIGNITY*/ /*take apostrophe out of answer choice*/
IF Q32 = 'Hair is blonde' or 'Yes'  THEN TROPE3 = 'Present'; /*INBORN DIGNITY*/
IF Q51_1 = 'Yes' THEN TROPE3 = 'Present'; /*INBORN DIGNITY*/
IF Q34 = 'Woman is wearing a dress' or 'Yes'  THEN TROPE3 = 'Present'; /*INBORN DIGNITY*/
IF Q34 = 'Woman is wearing trousers and a shirt' or 'Yes'  THEN TROPE6 = 'Present'; /*SYMBOLIC REBIRTH*/
IF Q38 = 'Girl is holding a plant' or 'Yes'  THEN TROPE6 = 'Present'; /*SYMBOLIC REBIRTH*/
IF Q38 = 'Girl is holding a baby' or 'Yes'  THEN TROPE3 = 'Present'; /*INBORN DIGNITY*/
IF Q38 = 'Girl is holding a flag' or 'Yes'  THEN TROPE5 = 'Present'; /*GEOGRAPHIC MATERIALIZATION*/
IF Q38 = 'Girl is holding a farming tool' or 'Yes'  THEN TROPE6 = 'Present'; /*SYMBOLIC REBIRTH*/
IF Q38 = 'Girl is holding a chilrens toy' or 'Yes'  THEN TROPE3 = 'Present'; /*INBORN DIGNITY*/ /*take apostrophe out of answer choice*/
IF Q39 = 'Hair is blonde' or 'Yes'  THEN TROPE3 = 'Present'; /*INBORN DIGNITY*/
IF Q41 = 'Girl is wearing trousers and a shirt (non Hitler-Youth Uniform)' or 'Yes'  THEN TROPE6 = 'Present'; /*SYMBOLIC REBIRTH*/
IF Q41 = 'Girl is wearing Hitler-Youth Uniform' or 'Yes'  THEN TROPE3 = 'Present'; /*INBORN DIGNITY*/
IF Q42_1 = 'Yes' THEN TROPE2 = 'Present';
IF Q59_1 = 'Yes' THEN TROPE4 = 'Present';
IF Q43 = 'The background of this poster includes a flag' or 'Yes'  THEN TROPE5 = 'Present';
IF Q43 = 'The background of this poster includes a globe' or 'Yes'  THEN TROPE5 = 'Present';
IF Q43 = 'The background of this poster includes a city/village/town' or 'Yes'  THEN TROPE5 = 'Present';
IF Q43 = 'The background of this poster includes a storefront/shop/retail building' or 'Yes'  THEN TROPE7 = 'Present';
IF Q44 = 'Soviet Union flag is depicted'  or 'Yes'  THEN TROPE1= 	'Present';
IF Q44 = 'German flag is depicted' or 'Yes'  THEN TROPE4= 'Present';
IF Q44 = 'American flag is depicted' or 'Yes'  THEN TROPE1= 'Present';
IF Q44 = 'French flag is depicted' or 'Yes'  THEN TROPE1= 'Present';
IF Q44 = 'British flag is depicted' or 'Yes'  THEN TROPE1= 'Present';
IF Q45_1 = 'Yes'/*SWATSIKA IS INCLUDED*/ THEN TROPE4= 'Present';
IF Q45_3 = 'Yes' /*JEWISH STAR IS INCLUDED*/ THEN TROPE2= 'Present';
IF Q45_4 = 'Yes' /*MONEY SIGN*/ THEN TROPE7= 'Present';
IF Q45_10 = 'Yes' /*HEIL HITLER HANDS SUSPENDED IN MID-AIR*/ THEN TROPE4= 'Present';
IF Q45_11 = 'Yes'/*PRICE TAG*/ THEN TROPE7= 'Present';
IF Q46_1 = 'Yes' THEN TROPE2 = 'Present';
IF Q63_1 = 'Yes' THEN TROPE2= 'Present';
IF Q64_1 = 'Yes' THEN TROPE6= 'Present'; /*Check if this is proper question name*/

/*What it does: Renaming each question title from qualtrics (IE- "Q1") to the proper  name "Coder" or "Common Enemy"*/
RENAME Q1=CODER Q2=POSTER_ID TROPE1=COMMON_ENEMY TROPE2=PROJECTION_DEVICES
TROPE3=INBORN_DIGNITY TROPE4=UNIFYING_VOICE TROPE5=GEOGRAPHIC_MATERIALIZATION 
TROPE6=SYMBOLIC_REBIRTH TROPE7=COMMERCIAL_USE;
RUN;

/*What it does: prints the algorithm for all 50 posters*/
PROC PRINT DATA=Thesis_Full_50_Tests;
RUN;


ODS TEXT= 'TROPE ASSIGNMENT FOR POSTERS 1 THROUGH 50';
Proc Print data=Thesis_Full_50_Tests;
	var CODER POSTER_ID COMMON_ENEMY PROJECTION_DEVICES INBORN_DIGNITY UNIFYING_VOICE 
	GEOGRAPHIC_MATERIALIZATION SYMBOLIC_REBIRTH COMMERCIAL_USE;
run;

Proc sort data=thesis_full_50_tests out=thesis_full_50_tests_sorted;
by POSTER_ID;
run;

TITLE 'TROPE ASSIGNMENT FOR POSTERS 1 THROUGH 50';
Proc print data=thesis_full_50_tests_sorted;
var CODER POSTER_ID COMMON_ENEMY PROJECTION_DEVICES INBORN_DIGNITY UNIFYING_VOICE 
	GEOGRAPHIC_MATERIALIZATION SYMBOLIC_REBIRTH COMMERCIAL_USE;
run;
TITLE;






/*
Multivariate Regression README Key

1933- 1
1934- 2
1935- 3
1936- 4
1937- 5
1938- 6

a-COMMON_ENEMY
b-PROJECTION_DEVICES
c-INBORN_DIGNITY
d-UNIFYING_VOICE
e-GEOGRAPHIC_MATERIALIZATION
f-SYMBOLIC_REBIRTH
g-COMMERCIAL_USE
*/




/*what it does: imports the binary variables with years to run the regression*/
PROC IMPORT DATAFILE="/home/u42893137/ZZ/binary logistic regression.xlsx"
		    OUT=regression
		    DBMS=XLSX
		    REPLACE;
RUN;


PROC PRINT DATA=regression; RUN;

/*what it does: runs a multivariate linear regression to try to predict the year fromo the presence or
absence of poster trope*/


proc reg data=regression;
	model year = a b c d e f g;
run;








data tropecount;
input Trope $;
datalines;
Unifying_Voice
Unifying_Voice
Unifying_Voice
Inborn_Dignity
None_Identified
Unifying_Voice
Unifying_Voice
Unifying_Voice
Common_Enemy
Projection_Devices
Geographic_Materialization
Unifying_Voice
Geographic_Materialization
Unifying_Voice
Unifying_Voice
Projection_Devices
Unifying_Voice
Symbolic_Rebirth
Inborn_Dignity
Unifying_Voice
Projection_Devices
Projection_Devices
Inborn_Dignity
Projection_Devices
Unifying_Voice
Inborn_Dignity
Projection_Devices
Projection_Devices
Projection_Devices
Projection_Devices
Projection_Devices
Geographic_Materialization
Projection_Devices
Geographic_Materialization
Projection_Devices
Projection_Devices
Projection_Devices
Projection_Devices
Geographic_Materialization
Symbolic_Rebirth
Inborn_Dignity
Inborn_Dignity
Projection_Devices
Commercial_Use
Inborn_Dignity
Geographic_Materialization
Geographic_Materialization
Unifying_Voice
Projection_Devices
Projection_Devices
Unifying_Voice
Projection_Devices
Projection_Devices
Common_Enemy
Unifying_Voice
None_Identified
Projection_Devices
Geographic_Materialization
Unifying_Voice
Projection_Devices
Projection_Devices
Common_Enemy
Projection_Devices
Projection_Devices
Unifying_Voice
;
run;

proc print data=tropecount;
run;

proc freq data=tropecount;
run;

proc sgplot data=tropecount;
vbar trope/
	dataskin=gloss
	fillattrs=(color=olive);
run;













/*LOG A*/
PROC IMPORT DATAFILE="/home/u42893137/ZZ/A_log_reg.xlsx"
		    OUT=Log_A
		    DBMS=XLSX
		    REPLACE;
RUN;

PROC PRINT DATA=Log_A; RUN;

proc logistic data=Log_A;
	model A = Year;
run;

/*LOG B*/
PROC IMPORT DATAFILE="/home/u42893137/ZZ/B_log_reg.xlsx"
		    OUT=Log_A
		    DBMS=XLSX
		    REPLACE;
RUN;

PROC PRINT DATA=Log_A; RUN;

proc logistic data=Log_A;
	model B = Year;
run;

/*LOG C*/
PROC IMPORT DATAFILE="/home/u42893137/ZZ/C_log_reg.xlsx"
		    OUT=Log_A
		    DBMS=XLSX
		    REPLACE;
RUN;

PROC PRINT DATA=Log_A; RUN;

proc logistic data=Log_A;
	model C = Year;
run;

/*LOG D*/
PROC IMPORT DATAFILE="/home/u42893137/ZZ/D_log_reg.xlsx"
		    OUT=Log_A
		    DBMS=XLSX
		    REPLACE;
RUN;

PROC PRINT DATA=Log_A; RUN;

proc logistic data=Log_A;
	model D = Year;
run;

/*LOG E*/
PROC IMPORT DATAFILE="/home/u42893137/ZZ/E_log_reg.xlsx"
		    OUT=Log_A
		    DBMS=XLSX
		    REPLACE;
RUN;

PROC PRINT DATA=Log_A; RUN;

proc logistic data=Log_A;
	model E = Year;
run;

/*LOG F*/
PROC IMPORT DATAFILE="/home/u42893137/ZZ/F_log_reg.xlsx"
		    OUT=Log_A
		    DBMS=XLSX
		    REPLACE;
RUN;

PROC PRINT DATA=Log_A; RUN;

proc logistic data=Log_A;
	model F = Year;
run;

/*LOG G*/
PROC IMPORT DATAFILE="/home/u42893137/ZZ/G_log_reg.xlsx"
		    OUT=Log_A
		    DBMS=XLSX
		    REPLACE;
RUN;

PROC PRINT DATA=Log_A; RUN;

proc logistic data=Log_A;
	model G = Year;
run;
