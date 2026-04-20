{smcl}
{* *! Stata version 19.5 --- 2026-04-20}{...}

{hilite: Setup}{...}
{right:{view "https://github.com/rampezione/stata-guide/raw/main/guides/data-processing/data-processing.sthlp":Data processing}}

{hline}

{cmd:{dlgtab:Working directory and log file}}

{pstd}Memory-usage report{p_end}
{phang2}{stata . memory}{p_end}

{pstd}Print current (working) directory{p_end}
{phang2}{stata . pwd}{p_end}

{pstd}Change working directory (same than pwd when using without arguments){p_end}
{phang2}{stata . cd} {it:"path in quotation marks"}{p_end}

{pstd}Display filenames in working directory{p_end}
{phang2}{stata . dir}{p_end}

{pstd}List all Stata data in working directory{p_end}
{phang2}{stata . dir *.dta}{p_end}

{pstd}List all do files in working directory{p_end}
{phang2}{stata . dir *.do}{p_end}

{pstd}Close a log file if any is open and do nothing if no log is open{p_end}
{phang2}{stata . capture log close}{p_end}

{pstd}Create a new log file or replace the existing file to record{p_end}
{pstd}your work and results. Log file can be opened, e.g., with Notepad.{p_end}
{phang2}{stata . log using "MyLog.log", replace}{p_end}

{pstd}Close a log file{p_end}
{phang2}{stata . log close}{p_end}


{cmd:{dlgtab:Find and install packages}}

{pstd}Display general help about the help system itself{p_end}
{phang2}{stata . help}{p_end}

{pstd}Display help infomation about the specified command or topic (here mdesc).{p_end}
{pstd}Information won't be found if the package has not been installed{p_end}
{phang2}{stata . help mdesc}{p_end}

{pstd}Search for information on a topic (here package mdesc) across all sources (default),{p_end}
{pstd}including the system help, the FAQs at the Stata website, the Stata Journal, and{p_end}
{pstd}all Stata-related Internet sources including community-contributed additions. {p_end}
{pstd}From the results, you can click to go to a source or to install additions.{p_end}
{phang2}{stata . search mdesc}{p_end}
 
{pstd}Original search command (equivalent to {stata . search mdesc, all}){p_end}
{phang2}{stata . findit mdesc}{p_end}
 
{pstd}Install the package mdesc (needs to be done once, after installation,{p_end}
{pstd}it will be available for use in subsequent Stata sessions.){p_end}
{phang2}{stata . ssc install mdesc}{p_end}

{pstd}Install and manage user-written additions (ado files) from the Internet.{p_end}
{pstd}Displays the current net location and lists the ado files on that site.{p_end}
{phang2}{stata . net}{p_end}

{pstd}Displays the current net from, net set ado, and net set other settings{p_end}
{phang2}{stata . net query}{p_end}

{pstd}Search Internet for installable packages (here mdesc){p_end}
{phang2}{stata . net search mdesc}{p_end}

{pstd}To see a description of package mdesc{p_end}
{phang2}{stata . net describe mdesc}{p_end}
{phang2}{stata ". net describe mdesc, from(http://fmwww.bc.edu/RePEc/bocode/m)"}{p_end}

{pstd}Install ado-files (here mdesc) and help files from a package{p_end}
{phang2}{stata . net install mdesc}{p_end}
{phang2}{stata ". net install mdesc, from(http://fmwww.bc.edu/RePEc/bocode/m)"}

{pstd}Manages the packages you have installed by using net.{p_end}
{pstd}Without arguments you can get a list of all the installed packages.{p_end}
{phang2}{stata . ado}{p_end}
{phang2}{stata . ado dir mdesc}                    

{pstd}Same as typing ado without arguments.{p_end}
{phang2}{stata . ado dir}{p_end}

{pstd}Describe all installed packages or a certain{p_end}
{phang2}{stata . ado describe}{p_end}
{phang2}{stata . ado describe mdesc}

{pstd}Update user-written ado-files{p_end}
{phang2}{stata . ado update}{p_end}

{pstd}Uninstall an installed package mdesc{p_end}
{phang2}{stata . ado uninstall mdesc}{p_end}


{hline}

{view "https://github.com/rampezione/stata-guide/raw/main/guides/data-processing/002_basic_data_operations.sthlp": back (Basic data operations)} / {view "https://github.com/rampezione/stata-guide/raw/main/guides/data-processing/004_import_data.sthlp":next (Open / save the data)}

