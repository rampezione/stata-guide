{smcl}
{* *! Stata version 19.5 --- 2026-04-20}{...}

{hilite: Explore data}{...}
{right:{view "https://github.com/rampezione/stata-guide/raw/main/guides/data-processing/data-processing.sthlp":Data processing}}

{hline}

{cmd:{dlgtab:View data organization}}

{pstd}Open the sample dataset{p_end}
{phang2}{stata . sysuse auto, clear}

{pstd}Description of the data (# of obs, vars) and list of variables (name, type, format, label){p_end}
{phang2}{stata . describe}

{pstd}Description of certain variables{p_end}
{phang2}{stata . describe price mpg}
 
{pstd}Number of observations in the data{p_end}
{phang2}{stata . count}

{pstd}Number of observations if rep78 is over 3 (Note! Including missing values){p_end}
{phang2}{stata . count if rep78>3}

{pstd}Missing values are treated as the largest positive number. To ignore missing values,{p_end}
{pstd}remember to use upper boundary. Several options can be used, e.g., <., !missing, !=. and so on.{p_end}
{phang2}{stata . count if rep78>3 & rep78<.}{p_end}
{phang2}{stata . count if rep78>3 & !missing(rep78)}{p_end}
{phang2}{stata . count if rep78>3 & rep78!=.}

{pstd}List of string variables{p_end}
{phang2}{stata . ds, has(type string)}

{pstd}List of variables with "ig" on the name or in its label{p_end}
{phang2}{stata `". lookfor "ig""'}

{pstd}Checks whether the specified variables uniquely identify the observations.{p_end}
{pstd}isid reports error if the variable does not uniquely identify the observations.{p_end}
{phang2}{stata . isid mpg}{p_end}
{phang2}{stata . isid mpg price}

{pstd}Find all duplicate values in each variable{p_end}
{phang2}{stata . duplicates report}{p_end}

{pstd}List all duplicated observations{p_end}
{phang2}{stata . duplicates list}{p_end}

{pstd}Duplicate first two observations using {cmd:expand} and list all duplicate observations{p_end}
{phang2}{stata . expand 2 in 1/2}{p_end}
{phang2}{stata . duplicates list}{p_end}

{pstd}Create variable dup containing the number of duplicates (0 if observation is unique){p_end}
{pstd}and then list the duplicated observations{p_end}
{phang2}{stata . duplicates tag, generate(dup)}{p_end}
{phang2}{stata . list if dup==1}{p_end}

{pstd}Drop all but the first occurrence of each group of duplicated observations{p_end}
{phang2}{stata . duplicates drop}{p_end}
{phang2}{stata . duplicates list}{p_end}

{pstd}List the data in memory{p_end}
{phang2}{stata . list, clean}

{pstd}List the first ten observations{p_end}
{phang2}{stata . list in 1/10}

{pstd}List the first ten observations without observation numbers{p_end}
{phang2}{stata . list in 1/10, noobs}

{pstd}List the last ten observations{p_end}
{phang2}{stata . list in -10/-1, noobs}

{pstd}List three variables from the first ten observations{p_end}
{phang2}{stata . list make price mpg in 1/10}

{pstd}Same for the next ten observations{p_end}
{phang2}{stata . list make price mpg in 11/20}

{pstd}List the variable make if foreign equals to 1{p_end}
{phang2}{stata . list make if foreign==1}

{pstd}Same as above, but draw separator line before and after observation 4 (Stata version 18 or later){p_end}
{phang2}{stata . list make if foreign==1, separator(4)}

{pstd}Display the unique values for rep78{p_end}
{phang2}{stata . levelsof rep78}{p_end}

{pstd}Verify truth of claim{p_end}
{phang2}{stata . assert price!=.}{p_end}
{phang2}{stata . assert price>=4000 & price<=8000}{p_end}
{phang2}{stata . assert foreign==0}{p_end}
{phang2}{stata . assert foreign==0 | foreign==1}


{cmd:{dlgtab:Exploring the data in browse mode}}

{pstd}The Data Editor looks much like a spreadsheet, with rows and columns corresponding to observations and{p_end}
{pstd}variables, respectively. At all times, one of the cells is highlighted. The observation (row) of the{p_end}
{pstd}current cell is called the current observation, and the variable (column) of the current cell is called{p_end}
{pstd}the current variable.

{pstd}You change the current cell by clicking with the mouse on another cell or by using the arrow keys.{p_end}

{pstd}To help distinguish between the different types of variables in the Editor, string values are displayed{p_end}
{pstd}in {error:red}, value labels are displayed in {browse "https://www.stata.com/manuals13/gsw6.pdf#page=4":blue}, and all other values are displayed in black. You can change{p_end}
{pstd}the colors for strings and value labels by right-clicking on the Data Editor window and selecting{p_end}
{pstd}Preferences... Same apply for other windows (i.e., Results, Viewer, Command).{p_end}

{pstd}Open dataset in the Data Editor with no ability to edit data (browse mode){p_end}
{phang2}{stata . browse}

{pstd}First five rows of the data{p_end}
{phang2}{stata . browse in 1/5}

{pstd}Values of three variables{p_end}
{phang2}{stata . browse make weight length}{p_end}

{pstd}Value of the variable make in row 23{p_end}
{phang2}{stata . browse make in 23}

{pstd}Values of the variable mpg for those whose foreign equals to 1{p_end}
{phang2}{stata . browse mpg if foreign==1}

{pstd}Values of the variables from price to weight, last five rows of the data{p_end}
{phang2}{stata . browse price-weight in -5/-1}

{pstd}Place observations in alphabetical order of make{p_end}
{phang2}{stata . gsort make}{p_end}

{pstd}Place observations in reverse alphabetical order of make{p_end}
{phang2}{stata . gsort -make}{p_end}

{pstd}Sort in order (ascending), first by price then miles per gallon{p_end}
{phang2}{stata . gsort price mpg}{p_end}

{pstd}Sort in order (descending), first by price then miles per gallon{p_end}
{phang2}{stata . gsort -price -mpg}{p_end}


{cmd:{dlgtab:Exploring the data in full-edit mode}}

{pstd}Open dataset in the Data Editor with possibility for entering new data and editing existing data (full-edit mode){p_end}
{phang2}{stata . edit}

{pstd}Same as above, but include only three variables{p_end}
{phang2}{stata . edit make weight length}

{pstd}Same as above, but only for observations where rep78 is missing{p_end}
{phang2}{stata . edit make weight length if rep78==.}


{dlgtab:more information}

{phang2}{stata . help assert}{p_end}
{phang2}{stata . help browse}{p_end}
{phang2}{stata . help count}{p_end}
{phang2}{stata . help ds}{p_end}
{phang2}{stata . help describe}{p_end}
{phang2}{stata . help dublicates}{p_end}
{phang2}{stata . help edit}{p_end}
{phang2}{stata . help gsort}{p_end}
{phang2}{stata . help isid}{p_end}
{phang2}{stata . help levelsof}{p_end}
{phang2}{stata . help list}{p_end}


{hline}

{view "https://github.com/rampezione/stata-guide/raw/main/guides/data-processing/004_import_data.sthlp": back (Open, save data)} / {view "https://github.com/rampezione/stata-guide/raw/main/guides/data-processing/006_data_types.sthlp": next (Change data types)}
