{smcl}
{* *! Stata version 19.5 --- 2025-04-20}{...}

{hilite: Setup}{...}
{right:{view "https://github.com/rampezione/stata-guide/raw/main/guides/data-processing/data-processing.sthlp":Data processing}}

{hline}

{cmd:{dlgtab:Loading dataset from local drive}}

{pstd}Clear memory: remove all data and value labels from memory, then load{p_end}
{pstd}a Stata dataset (MyData.dta) from the directory "C:\MyProjects\"{p_end}
{phang2}{stata . clear}{p_end}
{phang2}{stata `". use "C:\MyProjects\MyData.dta""'}{p_end}

{pstd}Same using clear as an option. This specifies that the data in memory will be replaced.{p_end}
{phang2}{stata `". use "C:\MyProjects\MyData.dta", clear"'}{p_end}

{pstd}Change the current working directory and load Stata dataset from there{p_end}
{phang2}{stata `". cd "C:\MyProjects\""'}{p_end}
{phang2}{stata . use MyData}{p_end}

{pstd}Load subset of the dataset (three variables){p_end}
{phang2}{stata . use id gender age using MyData, clear}{p_end}

{pstd}Load subset of the dataset (first 20 observations){p_end}
{phang2}{stata . use in 1/20 using MyData, clear}{p_end}

{pstd}Load subset of the dataset (women under 30 years old){p_end}
{phang2}{stata . use if gender=="Female" & age<30 using MyData, clear}{p_end}
 
{pstd}Load an example dataset installed with Stata{p_end}
{phang2}{stata . sysuse auto, clear}{p_end}

{pstd}Load an example dataset using exact directory{p_end}
{phang2}{stata `". use "C:\Program Files\StataNow19\ado\base\a\auto.dta", clear"'}{p_end}

{pstd}Import Excel file ({stata help import_excel}){p_end}
{phang2}{stata . import excel MyData.xlsx, firstrow clear}{p_end}

{pstd}Import a subset of an existing Excel file{p_end}
{phang2}{stata ". import excel MyData.xlsx, firstrow cellrange(A1:I60) clear"}{p_end}

{pstd}Import CSV file ({stata help import_delimited}){p_end}
{phang2}{stata . import delimited MyData.csv, clear}{p_end}

{pstd}Import SPSS-file ({stata help import_spss}){p_end}
{phang2}{stata . import spss MyData.sav, clear}{p_end}

{pstd}Import SAS-file ({stata help import_sas}){p_end}
{phang2}{stata . import sas MyData.sas7bdat, clear}{p_end}


{cmd:{dlgtab:Loading dataset from the web}}
 
{pstd}Report URL from which datasets will be obtained{p_end}
{phang2}{stata . webuse query}{p_end}

{pstd}Load an example dataset from Stata website{p_end}
{phang2}{stata . webuse auto, clear}{p_end}

{pstd}Load a dataset from Stata manual{p_end}
{phang2}{stata ". use https://www.stata-press.com/data/r19/lifeexp, clear"}{p_end}

{pstd}Specify URL from which dataset will be obtained, load the dataset, and{p_end}
{pstd}reset URL to default ("https://www.stata-press.com/data/r19"){p_end}
{phang2}{stata ". webuse set https://github.com/GeoCenter/StataTraining/raw/master/Day2/Data"}{p_end}
{phang2}{stata . webuse "wb_indicators_long", clear}{p_end}
{phang2}{stata . webuse set}{p_end}


{cmd:{dlgtab:Entering data maually}}

{pstd}Input allows you to type data directly into the dataset in memory. However, for most users,{p_end}
{pstd}edit is a better way to add observations to the dataset because it automatically adjusts the{p_end}
{pstd}storage type of variables, if required, to accommodate new values (see {stata help edit:help edit},{p_end}
{pstd}next chapter {help "https://github.com/rampezione/stata-guide/raw/main/guides/005_explore_data.sthlp":Explore data}).{p_end}
 
{phang2}{hline 3} {it:example input the data content} {hline 13}{p_end}
{phang2}{* example_start - input the data}{...}{p_end}
{phang2}clear{p_end}

{phang2}input id gender age{p_end}
{phang2}1 1 29{p_end}
{phang2}2 1 31{p_end}
{phang2}3 0 35{p_end}
{phang2}4 0 42{p_end}
{phang2}5 0 21{p_end}
{phang2}6 1 25{p_end}
{phang2}7 1 40{p_end}
{phang2}end{p_end}
{phang2}{* example_end}{...}{p_end}
{phang2}{txt}{...}{p_end}
{phang2}{hline 48}{p_end}
{phang2}{it:({stata "do https://github.com/rampezione/stata-guide/raw/main/guides/do-files/Example__Input_the_data.do":click to run})}{p_end}

{phang2}{stata . describe}{p_end}
{phang2}{stata . codebook, compact}{p_end}

 
{cmd:{dlgtab:Saving dataset}}

{pstd}Save the data in the current working directory{p_end}
{phang2}{stata . save MyData}{p_end}

{pstd}Save the data, replacing any existing file with the same name{p_end}
{phang2}{stata . save MyData, replace}{p_end}

{pstd}Save the data to another location{p_end}
{phang2}{stata `". save "C:\AnotherDir\MyData", replace"'}{p_end}

{pstd}Save the data in an older version of Stata. Stata 19 uses the same format as versions{p_end}
{pstd}14 through 18. Files saved in Stata 12 format can be read by Stata 11 or 12.{p_end}
{phang2}{stata . saveold MyData, replace version(13)}{p_end}
{phang2}{stata . saveold MyData, replace version(12)}{p_end}


{pstd}{it:--- Save subset of data: only three variables --------------------------------}{p_end}
{phang2}{stata . sysuse auto, clear}{p_end}

{pstd}Save the original dataset in memory{p_end}
{phang2}{stata . preserve}{p_end}

{pstd}Keep only three variables in the dataset{p_end}
{phang2}{stata . keep make price mpg}{p_end}

{pstd}Save a new version of the dataset, including only the current three variables{p_end}
{phang2}{stata . save auto_subset}{p_end}

{pstd}Recover the original dataset, including all variables{p_end}
{phang2}{stata . restore}{p_end}


{pstd}{it:--- Save the subset of the data (only if foreign is 1) -----------------------}{p_end}
{phang2}{stata . sysuse auto, clear}{p_end}
{phang2}{stata . preserve}{space 19}{p_end}
{phang2}{stata . keep if foreign==1}{p_end}
{phang2}{stata . save auto_subset, replace}{p_end}
{phang2}{stata . restore}{p_end}
 
 
{cmd:{dlgtab:Exporting dataset}}
 
{pstd}Open the data in Stata format{p_end}
{phang2}{stata . sysuse auto, clear}{p_end}

{pstd}Save a dataset in Excel format{p_end}
{phang2}{stata . export excel using auto, firstrow(variables)}{p_end}

{pstd}Save a subset of the data in Excel format{p_end}
{phang2}{stata . export excel make price mpg using auto_subset, firstrow(variables)}{p_end}
{phang2}{stata . export excel using auto_subset if foreign==1, firstrow(variables) replace}{p_end}

{pstd}Save a dataset in CSV format{p_end}
{phang2}{stata . export delimited using auto, firstrow(variables)}{p_end}

{pstd}Save a dataset in SPSS format{p_end}
{phang2}{stata . export spss using auto}{p_end}


{hline}

{view "https://github.com/rampezione/stata-guide/raw/main/guides/data-processing/003_setup.sthlp": back (Set up)} / {view "https://github.com/rampezione/stata-guide/raw/main/guides/data-processing/005_explore_data.sthlp":next (Explore data)}
