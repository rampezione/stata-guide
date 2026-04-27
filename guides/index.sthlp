{smcl}
{* *! version 1.0  2026-04-20}

{hilite: Stata guide {sf:(last updated: 20.4.2026)}}

{hline}

{pstd}Every time you start Stata, you'll see {browse "https://www.techtips.surveydesign.com.au/post/change-your-stata-interface-for-both-windows-and-mac":the user interface} structured around five key windows:{p_end}
 
{pstd}{space 2}- {cmd:Results window:} The main section in the center where you can see the results{p_end}
{pstd}{space 4}of the commands you run.{p_end} 
{pstd}{space 2}- {cmd:Command window:} Just underneath the Results window is the Command window where you{p_end}
{pstd}{space 4}can type commands when you aren't using the graphical user interface (GUI).{p_end} 
{pstd}{space 2}- {cmd:History window:} On the left is the History window, which shows all commands you've{p_end}
{pstd}{space 4}typed during your Stata session and all commands Stata created for you when you{p_end}
{pstd}{space 4}work with the GUI.{p_end} 
{pstd}{space 2}- Beneath the History window Stata displays the working directory. This is where Stata{p_end}
{pstd}{space 4}will save files if you don't specify another location.{p_end} 
{pstd}{space 2}- {cmd:Variables window:} At the top right is the Variables window, which contains a list of{p_end}
{pstd}{space 4}the variables in the current dataset. Click once on a variable name to select it, and{p_end}
{pstd}{space 4}information about the variable will be shown in the Properties window on the bottom{p_end}
{pstd}{space 4}right. Click twice, and the variable name will be pasted into the Command window.{p_end} 
{pstd}{space 2}- {cmd:Properties window:} Under the Variables window is the Properties window. You can use{p_end}
{pstd}{space 4}the Variables and Properties windows together to manage your variables, including{p_end}
{pstd}{space 4}their names, labels, value labels, notes, formats, and storage types.{p_end}
   
{pstd}That would be all about the GUI, this "guide" will concentrate purely on Stata's non-graphical{p_end}
{pstd}interface, i.e., the command line interface typing commands directly in Command window or in{p_end}
{pstd}{browse "https://www.stata.com/features/overview/do-file-editor/":Do-File Editor}.{p_end}

{pstd}All commands and codes are tested in Stata version 19.5 for Windows.{p_end}

{pstd}Tip! You don't need to copy and paste commands manually. Just click on any command in this guide to open{p_end}
{pstd}a dialog box. When you click "OK" in the box, the command will be executed automatically in Stata.{p_end}


{title:Main topics}

{pstd}{space 2}{view "https://github.com/rampezione/stata-guide/raw/main/guides/data-processing/data-processing.sthlp":Data Processing}{p_end}
{pstd}{space 2}Basic operations, data import and export, data exploration and summarization, changing data types, creating new variables, ...{p_end}

{pstd}{space 2}{view "https://github.com/rampezione/stata-guide/raw/main/guides/data-transformation/data-transformation.sthlp":Data Transformation}{error: ({it:under construction})}{p_end}
{pstd}{space 2}Subsetting data, replacing and modifying data, reshaping datasets, merging and appending data, ...{p_end}

{pstd}{space 2}{view "https://github.com/rampezione/stata-guide/raw/main/guides/data-analysis/data-analysis.sthlp":Data Analysis}{error: ({it:under construction})}{p_end}
{pstd}{space 2}Descriptive statistics, hypothesis testing, model fitting, diagnostics, postestimation, ...{p_end}

{pstd}{space 2}{view "https://github.com/rampezione/stata-guide/raw/main/guides/data-visualization/data-visualization.sthlp":Data Visualization}{error: ({it:partially complete})}{p_end}
{pstd}{space 2}Applying themes, plotting graphs, plot customization, saving plots, ...{p_end}

{pstd}{space 2}{view "https://github.com/rampezione/stata-guide/raw/main/guides/data-programming/data-programming.sthlp":Data Programming}{error: ({it:under construction})}{p_end}
{pstd}{space 2}Scalars, matrices, macros, stored r-class and e-class objects, loops, automation, ...{p_end}

{pstd}{space 2}{view "https://github.com/rampezione/stata-guide/raw/main/guides/miscellaneous/miscellaneous.sthlp":Miscellaneous}{error: ({it:under construction})}{p_end}
{pstd}{space 2}Tips, tricks, troubleshooting, ...{p_end}


{hline}

{space 2}{bf:References}
{space 4}- {browse "https://www.stata.com/flyers/stata-cheat-sheets/":Stata cheat sheets by data practitioners Dr. Tim Essam and Dr. Laura Hughes}
{space 4}- {browse "https://www.stata.com/manuals/u.pdf":Stata User's Guide (pdf file)}

{space 2}{bf:Useful links}
{space 4}- {browse "https://stats.oarc.ucla.edu/stata/":Introduction to Stata. UCLA: Statistical Consulting Group.}
{space 4}- {browse "https://wlm.userweb.mwn.de/Stata/wstatbas.htm":Internet Guide to Stata by Wolfgang Ludwig-Mayerhofer}
{space 4}- {browse "https://www.stata.com/links/":Resource links (Introduction to Stata basics, Learning Stata, Books, Blogs etc.)}
{space 4}- {browse "https://grodri.github.io/stata/":Stata Tutorial by Germán Rodríguez}
 
{space 2}{bf:Blogs}
{space 4}- {browse "https://blog.stata.com/":The Stata Blog}
{space 4}- {browse "https://statatexblog.com/":StataTex Blog}

{space 2}{bf:Tips}
{space 4}- {browse "https://www.techtips.surveydesign.com.au/":TechTips by SDAS}
{space 4}- {browse "https://www.toddrjones.com/book/QuickStataTips.pdf":Quick Stata Tips by Todd R. Jones (pdf file)}
