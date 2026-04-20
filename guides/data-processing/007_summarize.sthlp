{smcl}
{* *! Stata version 19.5 --- 2026-04-20}{...}

{hilite: Summarize data}{...}
{right:{view "https://github.com/rampezione/stata-guide/raw/main/guides/data-processing/data-processing.sthlp":Data processing}}

{hline}

{pstd}Open the sample dataset{p_end}
{phang2}{stata . sysuse auto, clear}


{dlgtab:one-way table}

{pstd}Frequency distribution{p_end}
{phang2}{stata . tabulate rep78}

{pstd}Report missing values{p_end}
{phang2}{stata . tabulate rep78, missing}{p_end}

{pstd}Almost all Stata commands and options can be abbreviated (and variables, see {stata . help novarabbrev}){p_end}
{phang2}{stata . tab rep78, mi}{p_end}
{phang2}{stata . ta rep78, mi}{p_end}
   
{pstd}Create dummy variable for every rep78 value and describe the contents using {cmd:codebook}{p_end}
{phang2}{stata . tabulate rep78, mi gen(RepRecord)}{p_end}
{phang2}{stata . codebook RepRecord1-RepRecord6, compact}{p_end}
 
{pstd}Frequency distribution for selected observations{p_end}
{phang2}{stata . tabulate rep78 if foreign==1}{p_end}

{pstd}Exclude observations for which foreign = 0 (report zeros, too){p_end}
{phang2}{stata . tabulate rep78, subpop(foreign)}{p_end}

{pstd}Repeat {cmd:tabulate} command separately for both value of the variable foreign{p_end}
{phang2}{stata ". bysort foreign: tab rep78"}{p_end}
 
{pstd}Package {cmd:fre} needs to be installed before using this command{p_end}
{phang2}{stata . ssc install fre}{p_end}
{phang2}{stata . fre foreign}{p_end}

{pstd}One-way table using {cmd:table} command{p_end}
{phang2}{stata . table rep78}{p_end}
{phang2}{stata . table rep78, statistic(percent)}{p_end}
{phang2}{stata . table rep78, stat(frequency) stat(percent)}{p_end}

{pstd}Replace column titles using -collect- command{p_end}
{phang2}{stata . table rep78, stat(frequency) stat(percent) miss}{p_end}
{phang2}{stata . collect label levels result frequency "N" percent "%", modify}{p_end}
{phang2}{stata . collect preview}{p_end}
 
 
{dlgtab:two-way table}

{pstd}Two-way table of frequencies without and with relative frequencies{p_end}
{phang2}{stata . tabulate rep78 foreign}{p_end}
{phang2}{stata . tabulate rep78 foreign, col}{p_end}
{phang2}{stata . tabulate rep78 foreign, row}{p_end}
{phang2}{stata . tabulate rep78 foreign, cell}{p_end}
{phang2}{stata . tabulate rep78 foreign, col row cell}{p_end}

{pstd}Report missing values{p_end}
{phang2}{stata . tab rep78 foreign, miss}{p_end}

{pstd}Do not display frequencies{p_end}
{phang2}{stata . tab rep78 foreign, col nofreq}{p_end}

{pstd}Report Pearson's chi-squared and Fisher's exact test{p_end}
{phang2}{stata . tab rep78 foreign, chi exact}{p_end}
 
{pstd}Two-way table without the raw data, backslash starts a new row{p_end}
{phang2}{stata . tabi 2 0 \ 8 0 \ 27 3 \ 9 9 \ 2 9}{p_end}
{phang2}{stata . tabi 2 0 \ 8 0 \ 27 3 \ 9 9 \ 2 9, col chi exact}{p_end}

{pstd}Two-way table using {cmd:table} command{p_end}
{phang2}{stata . table rep78 foreign}{p_end}
{phang2}{stata . table rep78 foreign, statistic(percent)}{p_end}
{phang2}{stata . table rep78 foreign, stat(frequency) stat(percent)}{p_end}
{phang2}{stata . table rep78 foreign, stat(frequency) stat(percent, across(foreign))}{p_end}
 
 
{dlgtab:multi-way table}

{phang2}{stata . generate price5k=(price>=5000) if price<.}{p_end}
{phang2}{stata . label define p5k 0 "Under 5k" 1 "At least 5k"}{p_end}
{phang2}{stata . label values price5k p5k}{p_end}
{phang2}{stata . table (price5k rep78) (foreign), stat(percent, across(foreign))}{p_end}
{phang2}{stata . table (rep78) (foreign) (price5k), stat(percent, across(foreign))}{p_end}
  

{dlgtab:descriptive statistics}
 
{pstd}Display codebook for all variables in dataset{p_end}
{phang2}{stata . codebook}{p_end}
{phang2}{stata . codebook _all}{p_end}
{phang2}{stata . codebook, header}{p_end}

{pstd}Compact report for all variables in dataset{p_end}
{phang2}{stata . codebook, compact}{p_end}

{pstd}Report potential problems with dataset{p_end}
{phang2}{stata . codebook, problems}{p_end}

{pstd}Summary statistics for all variables{p_end}
{phang2}{stata . summarize}{p_end}

{pstd}Summary of the mpg variable, without/with additional statistics{p_end}
{phang2}{stata . summarize mpg}{p_end}
{phang2}{stata . summarize mpg, detail}{p_end}

{pstd}Summary for variables from mpg through weight (inclusive){p_end}
{phang2}{stata . summarize mpg-weight}{p_end}

{pstd}Summary for all variables starting with marks "rep"{p_end}
{phang2}{stata . summarize rep*}{p_end}

{pstd}Most commands can be abbreviated{p_end}
{phang2}{stata . su mpg if foreign==1}{p_end}

{pstd}Summary statistics for factor variable rep78 (e.g., 11.6% of the 69 cars have a fair repair record){p_end}
{phang2}{stata . su i.rep78}{p_end}

{pstd}Stats of mpg for each category of foreign{p_end}
{phang2}{stata ". bysort foreign: su mpg"}{p_end}
 
{pstd}Histogram + num of missing values and zeroes{p_end}
{phang2}{stata . inspect mpg}{p_end}

{pstd}One-way table of means and standard deviations{p_end}
{phang2}{stata . tabulate foreign, sum(price)}{p_end}

{pstd}Two-way table of means and standard deviations{p_end}
{phang2}{stata . tabulate foreign rep78, sum(price)}{p_end}

{pstd}Same using bysort{p_end}
{phang2}{stata ". bysort rep78: tab foreign, sum(price)"}{p_end}

{pstd}In addition of condition, mpg<30{p_end}
{phang2}{stata ". bysort rep78: tab foreign if mpg<30, sum(price)"}{p_end}

{phang2}{stata . tabstat price mpg weight, stats(n mean sd med min max)}{p_end}
{phang2}{stata . tabstat price mpg weight, stats(n mean sd med min max) by(foreign) columns(variables)}{p_end}
{phang2}{stata . tabstat price mpg weight, stats(n mean sd med min max) by(foreign) columns(statistics)}{p_end}
{phang2}{stata . tabstat price mpg weight, stats(n mean sd med min max) by(foreign) columns(statistics) format(%9.1f)}{p_end}

{phang2}{stata . table foreign, statistic(mean mpg price)}{p_end}
{phang2}{stata . table foreign if rep78==3, statistic(mean mpg price)}{p_end}
{phang2}{stata . table foreign, statistic(mean mpg price) statistic(sd mpg price)}{p_end}
 
{phang2}{stata . table foreign, statistic(mean mpg price) statistic(sd mpg price) nformat(%5.2f)}{p_end}
{phang2}{stata . collect title "Mean and standard deviation of mpg and price by car origin"}{p_end}
{phang2}{stata . collect preview}{p_end}
{phang2}{stata . collect note "Footnote ..."}{p_end}
{phang2}{stata . collect preview}{p_end}

{pstd}Two statistics in the same table{p_end}
{phang2}{stata . table foreign, statistic(mean mpg price) statistic(sd mpg price) nformat(%5.2f)}{p_end} 

  
{dlgtab:more information}

{phang2}{stata . help tabulate}{p_end}
{phang2}{stata . help codebook}{p_end}
{phang2}{stata . help by}{p_end}
{phang2}{stata . help fre}{p_end}
{phang2}{stata . help table}{p_end}
{phang2}{stata . help collect}{p_end}
{phang2}{stata . help tabulate_twoway}{p_end}
{phang2}{stata . help summarize}{p_end}
{phang2}{stata . help tabstat}{p_end}

 
{hline}
{view "https://github.com/rampezione/stata-guide/raw/main/guides/data-processing/006_data_types.sthlp": back (Data types)} / {view "https://github.com/rampezione/stata-guide/raw/main/guides/data-processing/008_new_variables.sthlp": next (New variables)}
