{smcl}
{* *! Stata version 19.5 --- 2025-08-20}{...}

{hilite: Useful shortcuts}{...}
{right:{view "https://github.com/rampezione/stata-guide/raw/main/guides/data-processing/data-processing.sthlp":Data Processing}}

{hline}

{pstd}Stata has many useful shortcuts for different features. For example, you can save the file,{p_end}
{pstd}jump to Variables window, or execute quickly the command in Do-file Editor using these{p_end}
{pstd}keystrokes. You're also able to define shortcuts for your own purposes.{p_end}


{cmd:{dlgtab:Stata interface}}

{pstd}{browse "https://www.techtips.surveydesign.com.au/post/change-your-stata-interface-for-both-windows-and-mac":Stata's interface} is made up of several "windows": History, Results, Command, Variables, and{p_end}
{pstd}Properties. All these windows (except the Results window) have their names in their title bars.{p_end}
{pstd}Using certain keystrokes, you're able to jump from window to window, finding help or results{p_end}
{pstd}in Results window and so on.{p_end}

{phang2}-------------------------------------------------------------------------------------{p_end}
{phang2}{space 1}{bf:Shortcut}{space 15}{bf:Description}{p_end}
{phang2}-------------------------------------------------------------------------------------{p_end}
{phang2}{space 1}Tab (tabulator key){space 4}Press once to activate the Command window, and press again{p_end}
{phang2}{space 24}when Command window is activated, a list of all variables{p_end}
{phang2}{space 24}in the dataset will be opened. In Command window, Tab{p_end}
{phang2}{space 24}autocompletes a partially typed variable name when possible{p_end}
{phang2}{space 24}or presents a list of similar names if there could be more{p_end}
{phang2}{space 24}than one completion.{p_end} 
{phang2}{space 1}Ctrl + 1{space 15}Activates the Command window{p_end}
{phang2}{space 1}Ctrl + 2{space 15}Activates the Results window{p_end}
{phang2}{space 1}Ctrl + 3{space 15}Activates the History window{p_end}
{phang2}{space 1}Ctrl + 4{space 15}Activates the Variables window{p_end}
{phang2}{space 1}Ctrl + 5{space 15}Activates the Properties window{p_end} 
{phang2}{space 1}Ctrl + Tab{space 13}Changes the active window (Command, Results, History,{p_end}
{phang2}{space 24}Variables, Properties){p_end} 
{phang2}{space 1}Ctrl + 7 or F1 key{space 5}Display {browse "https://www.stata.com/links/stata-basics/searching-for-help/":Advice on finding help} in Viewer window{p_end} 
{phang2}{space 1}Ctrl + 8{space 15}Opens the Data Editor{p_end}
{phang2}{space 1}Ctrl + 9{space 15}Opens a new Do-file Editor (typing {stata doedit:doedit} in the{p_end}
{phang2}{space 24}Command window following Enter will do the same trick){p_end} 
{phang2}{space 1}Ctrl + A{space 15}Selects all in Results window{p_end}
{phang2}{space 1}Ctrl + F{space 15}Finds in Results window or Do-file Editor{p_end}
{phang2}{space 1}Ctrl + R{space 15}Previously used command in Command window{p_end}
{phang2}{space 1}Ctrl + S{space 15}Saves the file{p_end}
{phang2}{space 1}Ctrl + Shift + S{space 7}Saves as the file{p_end} 
{phang2}{space 1}PageUp{space 17}Steps backward through the command history in Command window{p_end}
{phang2}{space 1}PageDown{space 15}Steps forward through the command history in Command window{p_end}
{phang2}-------------------------------------------------------------------------------------{p_end}
 
{cmd:{dlgtab:Do-file Editor}}

{pstd}{browse "https://www.stata.com/features/overview/do-file-editor/":Do-file Editor} is a text editor that comes installed with Stata. Stata uses {it:do-files}, which{p_end}
{pstd}are text files containing a list of Stata commands. You can create a do-file using any simple{p_end}
{pstd}text editor. These files can be run as batch jobs in Stata, meaning you can ask Stata to execute{p_end}
{pstd}all the commands in the file at once {c 151} either by selecting File => Do... from the menu, or{p_end}
{pstd}by running the commands directly from the Do-file Editor.{p_end} 
{pstd}This approach is useful for several reasons:{p_end} 
{phang2}- {cmd:Efficiency:} If you run the same analysis multiple times, you don't need to rewrite{p_end}
{phang2}the commands each time, which will save you time.{p_end} 
{phang2}- {cmd:Reproducibility:} Running an analysis from a do-file makes your results easily reproducible,{p_end}
{phang2}both for yourself and for others who want to replicate your work.{p_end} 
{phang2}- {cmd:Flexibility:} If you need to change part of your analysis, you can simply update the do-file{p_end}
{phang2}and re-run it, rather than manually redoing everything in Stata.{p_end} 
{pstd}(ref: {browse "https://www.techtips.surveydesign.com.au/post/the-do-file-editor-an-introduction":TechTips by SDAS}){p_end}

{pstd}You're able to open the new Do-file Editor either by selecting Window => Do-file Editor =>{p_end}
{pstd}New Do-File Editor, using shortcut Ctrl+9, or typing {stata doedit} in the Command window.{p_end}

{phang2}-------------------------------------------------------------------------------------{p_end}
{phang2}{space 1}{bf:Shortcut}{space 15}{bf:Description}{p_end}
{phang2}-------------------------------------------------------------------------------------{p_end}
{phang2}{space 1}Ctrl + D{space 15}Executes the highlighted commands in Do-file Editor{p_end}
{phang2}{space 24}or all lines if nothing is highlighted{p_end}
{phang2}{space 1}Ctrl + Shift + D{space 7}Executes all commands starting from the line where{p_end}
{phang2}{space 24}the cursor is placed, down to the last line{p_end}
{phang2}{space 1}Ctrl + Shift + E{space 7}Executes the current line{p_end}
{phang2}{space 1}Ctrl + F{space 15}Opens the Find dialog{p_end}
{phang2}{space 1}Ctrl + H{space 15}Opens the Replace dialog{p_end}
{phang2}{space 1}Ctrl + L{space 15}Go to a specific line number{p_end}
{phang2}{space 1}Ctrl + N{space 15}Creates a new do-file in same Editor window{p_end}
{phang2}{space 1}Ctrl + O{space 15}Opens an existing do-file{p_end}
{phang2}{space 1}Ctrl + R{space 15}Runs quietly the highlighted commands{p_end}
{phang2}{space 1}Ctrl + S{space 15}Saves the current do-file{p_end}
{phang2}{space 1}Ctrl + Shift + S{space 7}Saves as the current do-file{p_end}
{phang2}{space 1}Ctrl + Shift + Y{space 7}Selects the entire current file{p_end}
{phang2}{space 1}Ctrl + Tab{space 13}Changing the active do-file if multiple do-files are opened{p_end}
{phang2}{space 24}in same Editor window{p_end}
{phang2}-------------------------------------------------------------------------------------{p_end}


{cmd:{dlgtab:Function keys (F-keys)}}

{pstd}Display {browse "https://www.stata.com/links/stata-basics/searching-for-help/":Advice on finding help} in Viewer window{p_end}
{phang2}{c 149} F1{p_end}

{pstd}List of the variables in memory with a description{p_end}
{phang2}{c 149} F2{p_end}

{pstd}These keys are reserved by Windows and cannot be reassigned in Stata{p_end}
{phang2}{c 149} F3{p_end}
{phang2}{c 149} F10{p_end}

{pstd}Prints {cmd:save} in the Command window{p_end}
{phang2}{c 149} F7{p_end}

{pstd}Prints {cmd:use} in the Command panel{p_end}
{phang2}{c 149} F8{p_end}

{pstd}You can change the definitions of function keys in Stata {c 151} except for F3 and F10, which are{p_end}
{pstd}reserved. For example, if you would like to see a compact report of all variables in the dataset,{p_end}
{phang2}{stata . webuse auto, clear}{p_end}
{phang2}{stata . codebook, compact}{p_end}
 
{pstd}Rather than typing {cmd:codebook, compact} each time, you can assign this command to the F4 key:{p_end}

{phang2}{stata . global F4 "codebook, compact"}{p_end}
	
{pstd}Now, pressing F4 followed by Enter will run the command and display the compact report.{p_end}

{pstd}If you really want this shortcut to persist every time you start Stata, you have two options:{p_end}
{pstd}Type the {cmd:global} command manually every time you start Stata, or save the command in a special{p_end}
{pstd}file named profile.do, which Stata automatically executes at startup (if the profile.do is{p_end}
{pstd}placed in the correct directory). See {browse "https://www.stata.com/support/faqs/programming/profile-do-file/":Stata/FAQs/profile do-file}.{p_end}

{pstd}To do this, open a new Do-file Editor ({stata doedit:click to open Do-file editor}), copy and paste{p_end}
{pstd}the following lines, and save the file as profile.do in the appropriate directory:{p_end} 
{pstd}"Stata searches for profile.do in the following order:{p_end} 
{phang2}- the directory where Stata is installed,{p_end}
{phang2}- the current working directory,{p_end}
{phang2}- any directory listed in your system path,{p_end}
{phang2}- your home directory (typically C:\Users\username), as defined{p_end}
{phang2}{space 2}by Window's USERPROFILE environment variable, and{p_end}
{phang2}- along the ado-path (see {browse "https://www.stata.com/manuals/psysdir.pdf#psysdir":[P] sysdir}).{p_end} 
{pstd}We recommend placing profile.do in your home directory to ensure it runs consistently."{p_end}
{pstd}(ref: {browse "https://www.stata.com/manuals/gswb.pdf#B.3ExecutingcommandseverytimeStataisstarted":1.3 Executing commands every time Stata is started,Stata manual}).{p_end}

{pstd}{hline 3} profile.do {hline 60}{p_end}

{phang2}{stata . set update_query off}{space 11}{error:// Sets automatic updates off}{p_end}
{phang2}{stata . set update_prompt off}{space 10}{error:// Turns off the update prompt}{p_end}
{phang2}{stata . set more off}{space 19}{error:// Tells Stata not to pause (i.e., display a -more- message)}{p_end}
{phang2}{stata . set varabbrev off}{space 14}{error:// Disables the feature that allows variable names to be abbreviated}{p_end}
{phang2}{stata . set scheme white_tableau}{space 7}{error:// Sets the graphics scheme to be white tableau}{p_end}
{phang2}{space 33}{error:// (needs schemepack package => {stata . ssc install schemepack})}{p_end}
{phang2}{stata . set doeditbackup off}{space 11}{error:// Instructs Stata not to create Do-file Editor backup (*.stswp)}{p_end}
{phang2}{space 33}{error:// files (Stata 16 or later)}{p_end}
{phang2}{stata . set reshape_favor speed}{space 8}{error:// Specifies default method for reshaping the data (Stata 18 or later)}{p_end}
{phang2}{stata . global F4 "codebook, compact"}{space 2}{error:// Sets the F4 key to see the compact report of all variables}{p_end}
{phang2}{space 33}{error:// in the data (F4 + enter)}{p_end}

{pstd}{hline 75}{p_end}

{pstd}Now, every time you start Stata, the above eight set / global commands will be executed. 

{cmd:{dlgtab:Commands}}

{pstd}Some Stata commands can also be seen as shortcuts. They allow you to, for instance, clear the{p_end}
{pstd}console, open a new Do-file Editor, or remove data from memory.{p_end}

{phang2}-------------------------------------------------------------------------------------------{p_end}
{phang2}{space 1}{bf:Shortcut (command)}{space 7}{bf:Description}{p_end}
{phang2}-------------------------------------------------------------------------------------------{p_end}
{phang2}{space 1}{stata . clear}{space 18}Deletes data in memory{p_end}
{phang2}{space 1}{stata . cls}{space 20}Clears the console (the Results window){p_end}
{phang2}{space 1}{stata . exit}{space 19}Exits Stata{p_end}
{phang2}{space 1}{stata . exit, clear}{space 12}Exits even if the current dataset has not been saved{p_end} 
{phang2}{space 1}{stata . preserve}{space 15}Saves the current state of the dataset in memory{p_end}
{phang2}{space 1}{stata . restore}{space 16}Restores the dataset to the state saved by -preserve-{p_end} 
{phang2}{space 1}{stata . doedit}{space 17}Opens a new Do-file Editor{p_end}
{phang2}{space 1}{stata . ~\mydir\mydata.dta}{space 5}Refers to a dataset in a subdirectory within your home directory{p_end}
{phang2}{space 1}{stata . about}{space 18}Displays information about your version of Stata{p_end}
{phang2}{space 1}{stata . varabbrev}{space 14}Temporarily turns on variable abbreviation if it is off{p_end} 
{phang2}{space 1}{stata . set linesize}{space 11}Specifies screen width{p_end}
{phang2}{space 1}{stata . set maxvar}{space 13}Increases the maximum number of variables (see {stata . help memory}){p_end}
{phang2}{space 1}{stata . set obs}{space 16}Changes the number of observations in the current dataset{p_end}
{phang2}-------------------------------------------------------------------------------------------{p_end}
 

{hline}

{view "https://github.com/rampezione/stata-guide/raw/main/guides/data-processing/data-processing.sthlp": back (Data Processing)} / {view "https://github.com/rampezione/stata-guide/raw/main/guides/data-processing/002_basic_data_operations.sthlp":next (Basic data operations)}
