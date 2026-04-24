{smcl}
{* *! Stata version 19.5 --- 2026-04-23}{...}

{hilite: Graph schemes and themes}{...}
{right:{view "https://github.com/rampezione/stata-guide/raw/main/guides/data-visualization/data-visualization.sthlp":← Back to Data Visualization}}

{hline}

{pstd}A {it:graphics scheme} in Stata controls the overall visual appearance of graphs:{p_end}
{pstd}colors, marker symbols, line patterns, background shading, fonts, margins, and many other{p_end}
{pstd}stylistic elements. Schemes allow you to maintain a consistent visual identity across {p_end}
{pstd}figures and tailor the look of plots for publications, reports, or teaching materials.{p_end}


{dlgtab:Default graph scheme and settings}

{pstd}Show graphics settings including the used scheme{p_end}
{phang2}{stata . query graphics}{p_end}

{pstd}List of the available schemes{p_end}
{phang2}{stata . graph query, schemes}{p_end}

{pstd}Set the default scheme for the rest of the session{p_end}
{phang2}{stata . set scheme sj}{space 27}{error:// The previous official scheme of the {it:Stata Journal} is sj}{p_end}
{phang2}{stata . set scheme stsj}{space 25}{error:// The current official scheme of the {it:Stata Journal} is stsj}{p_end}

{pstd}Compare different schemes without closing graph{p_end}
{phang2}{stata . webuse auto, clear}{p_end}
{phang2}{stata . twoway scatter price mpg}{space 16}{error:// Do not close the graph!}{p_end}
{phang2}{stata . graph display Graph, scheme(economist)}{p_end}
{phang2}{stata . graph display Graph, scheme(s2mono)}{p_end}
{phang2}{stata . graph display Graph, scheme(stcolor)}{p_end}
{phang2}{stata . graph close}{p_end}

{pstd}Compare different schemes using option scheme{p_end}
{phang2}{stata . twoway scatter price mpg, scheme(economist)}{p_end}
{phang2}{stata . twoway scatter price mpg, scheme(s2mono)}{p_end}
{phang2}{stata . twoway scatter price mpg, scheme(stcolor)}{p_end}

{pstd}Marker symbol, color, titles etc. can be changes using options{p_end}
{phang2}{stata . twoway scatter price mpg, scheme(stcolor) mcolor(navy)}{space 18}{error:// Change the marker color}{p_end}
{phang2}{stata . twoway scatter price mpg, scheme(stcolor) mcolor(navy) msymbol(square)}{space 2}{error:// Change the marker symbol}{p_end}
{phang2}{stata . twoway scatter price mpg, scheme(stcolor) xtitle(Mileage)}{space 15}{error:// Change the title in x-axis}{p_end}

{pstd}Set the scheme as the default scheme in future sessions{p_end}
{phang2}{stata . set scheme stsj, permanently}{p_end}


{dlgtab:Installing custom schemes}

{pstd}Throughout this guide, all graph examples are tested using the {it:white_tableau} scheme,{p_end}
{pstd}which is part of {it:schemepack} package written by Asjad Naqvi:{browse "https://github.com/asjadnaqvi/stata-schemepack": GitHub / schemepack}.{p_end}
{pstd}The style is minimalistic, modern, and suitable for publications.{p_end}

{pstd}Schemepack can be installed from the Statistical Software Components (SSC) archive or GitHub.{p_end}
{pstd}GitHub files might contain latest updates that have not been currently pushed to SSC.{p_end}
{phang2}{stata . ssc install schemepack, replace}{p_end}
{phang2}{stata ". net install schemepack, from(https://raw.githubusercontent.com/asjadnaqvi/stata-schemepack/main/installation/) replace"}{p_end}

{pstd}After installation, you can use one of the schemes from this shemeback.{p_end}
{phang2}{stata . graph query, schemes}{p_end}
{phang2}{stata . twoway scatter price mpg, scheme(gg_ptol)}{p_end}
{phang2}{stata . twoway scatter price mpg, scheme(black_hue)}{p_end}
{phang2}{stata . twoway scatter price mpg, scheme(white_tableau)}{space 24}{error:// Asjad's default scheme}{p_end}

{pstd}A wide range of modern, publication-ready graphics schemes is available{p_end}
{pstd}from the Stata community. Below you may found a couple of them.{p_end}
{phang2}{stata . ssc install blindschemes, replace}{space 38}{error:// plotplain and plottig by Daniel Bischof}{p_end}
{phang2}{stata . help blindschemes}{space 54}{error:// {browse "https://www.danbischof.com/assets/pdf/Bischof2017Stata.pdf":New graphic schemes for Stata - plotplain and plottig} (pdf)}{p_end}
{phang2}{stata . help plotplain}{p_end}
{phang2}{stata . twoway scatter price mpg, scheme(plotplain)}{p_end}
{phang2}{stata . twoway scatter price mpg, scheme(plotplainblind)}{p_end}

{phang2}{stata ". net install cleanplots, from(https://tdmize.github.io/data) replace"}{space 4}{error:// {browse "https://www.trentonmize.com/software/cleanplots":cleanplots} by Trenton D. Mize}{p_end}
{phang2}{stata . help cleanplots}{p_end}
{phang2}{stata . twoway scatter price mpg, scheme(cleanplots)}{p_end}


{dlgtab:Creating your own schemes}

{pstd}Custom graph themes can be created by writing dedicated graphics scheme files{p_end}
{pstd}(.scheme) or by using tools such as grstyle, which allow users to define{p_end}
{pstd}styling programmatically within do-files.{p_end}

{pstd}grstyle by Ben Jann is a Stata module to customize the overall look of graphs{p_end}
{phang2}{stata . ssc install grstyle, replace}{space 14}{error:// {browse "https://github.com/benjann/grstyle":GitHub / grstyle}}{p_end}
{phang2}{stata . ssc install palettes, replace}{space 13}{error:// {browse "https://repec.sowi.unibe.ch/stata/grstyle/index.html":grstyle} - Customizing Stata graphs made easy}{p_end}
{phang2}{stata . ssc install colrspace, replace}{space 12}{error:// {browse "https://repec.sowi.unibe.ch/stata/grstyle/getting-started.html":Getting started} - How to use grstyle}{p_end}
{phang2}{stata . help grstyle}{space 30}{error:// {browse "https://repec.sowi.unibe.ch/stata/grstyle/grstyle-set.html":Examples}}{p_end}
{phang2}{stata . set scheme s2color}{space 24}{error:// Start with a certain scheme (here s2color)}{p_end}
{phang2}{stata . twoway scatter price mpg}{space 18}{error:// Draw a plot}{p_end}
{phang2}{stata . grstyle init}{space 30}{error:// Make adjustments}{p_end}
{phang2}{stata . grstyle color background white}{p_end}
{phang2}{stata . grstyle graphsize x 5}{p_end}
{phang2}{stata . grstyle graphsize y 5}{p_end}
{phang2}{stata . grstyle set noextend}{p_end}
{phang2}{stata . twoway scatter price mpg}{space 18}{error:// Draw a plot}{p_end}
{phang2}{stata . grstyle clear}{space 29}{error:// Revert back to original scheme (here s2color)}{p_end}

{pstd}Alternatively, you can base your scheme on one of Stata’s official schemes,{p_end}
{pstd}or on a scheme derived from an official Stata scheme. (see {stata help scheme files}){p_end}

{pstd}Scheme {it:schemename} is stored in file scheme-schemename.scheme. For example, scheme s2color is{p_end}
{pstd}stored in file scheme-s2color.scheme. You can find where a scheme file is located by typing{p_end}
{phang2}{stata . which scheme-s2color.scheme}{p_end}

{pstd}To create a new scheme, say mine, you need only create a file with the name scheme-mine.scheme{p_end}
{pstd}in your PERSONAL directory. You should always base your scheme on a scheme shipped with Stata{p_end}
{pstd}or on another scheme based on an official scheme shipped with Stata. If you want to base your{p_end}
{pstd}scheme on the scheme s2color, you would put the line{p_end}

{phang2}#include s2color{p_end}

{pstd}before any scheme-file entries in your scheme.{p_end}

{phang2}{hline 3} {it:example scheme-mine.scheme} {hline 19}{p_end}
{phang2}{* example_start - create own scheme}{...}{p_end}
{phang2}* Description of the new scheme can be added here{p_end}

{phang2}*! version 1.0.0 2026-04-23{p_end}

{phang2}#include s2color{p_end}

{phang2}color background white{p_end}
{phang2}color major_grid "200 200 200"{p_end}
{phang2}{p_end}
{phang2}color p1{space 9}"128 195 66"{p_end}
{phang2}color p2{space 9}navy{p_end}

{phang2}anglestyle vertical_tick horizontal{p_end}

{phang2}clockdir legend_position 4{p_end}
{phang2}numstyle legend_cols{space 5}1{p_end}
{phang2}linestyle legend none{space 4}{p_end}
{phang2}margin legend{space 12}"5 0 0 0"{p_end}
{phang2}{* example_end}{...}{p_end}
{phang2}{txt}{...}{p_end}
{phang2}{hline 50}{p_end}

{pstd}You can test the example above by first installing the scheme from GitHub.{p_end}
{phang2}{stata ". net install scheme-mine, from(https://github.com/rampezione/stata-guide/raw/main/guides/schemes/)"}{p_end}

{pstd}Then set the scheme and draw the graph with original and modified scheme.{p_end}
{phang2}{stata . set scheme mine}{p_end}
{phang2}{stata . graph bar rep78, over(foreign) scheme(s2color)}{p_end}
{phang2}{stata . graph bar rep78, over(foreign) scheme(mine)}{p_end}

{pstd}In the end, remember to reset URL to default.{p_end}
{phang2}{stata . webuse set}{p_end}


{pstd}Graph schemes and styling tools can also be combined. One common workflow is to{p_end}
{pstd}start from an existing scheme and then apply additional style adjustments using{p_end}
{pstd}tools such as {it:grstyle}.{p_end}

{pstd}In the example below, the first graph is based on the base scheme and the second{p_end}
{pstd}one is refined by modifying selected graphical elements directly in the analysis{p_end}
{pstd}script. This approach allows you to maintain a consistent overall look while{p_end}
{pstd}retaining flexibility for project-specific customization. In this example, graphs{p_end}
{pstd}will be combined in order to compare them.{p_end}

{phang2}{hline 3} {it:example combining scheme and styling tools} {hline 23}{p_end}
{phang2}{* example_start}{...}{p_end}
{phang2}clear{p_end}
{phang2}sysuse pop2000, clear{p_end}

{phang2}replace maletotal = -maletotal/1e+6{p_end}
{phang2}replace femtotal =  femtotal/1e+6{p_end}

{phang2}* Graph using the base scheme (gg_hue){p_end}
{phang2}set scheme gg_hue{p_end}

{phang2}twoway ///{p_end}
{phang2}{space 4}bar maletotal agegrp, horizontal xvarlab(Male) ||{space 11}///{p_end}
{phang2}{space 4}bar femtotal  agegrp, horizontal xvarlab(Female) ||{space 10}///{p_end}
{phang2}{space 4}, ylabel(1(1)17, valuelabel labsize(*.8) angle(0)){space 10}///{p_end}
{phang2}{space 4}xtitle("Population in millions") ytitle(""){space 17}///{p_end}
{phang2}{space 4}xlabel(-10 "10" -7.5 "7.5" -5 "5" -2.5 "2.5" 2.5 5 7.5 10){space 2}///{p_end}
{phang2}{space 4}legend(label(1 Male) label(2 Female) pos(1) ring(0) row(2)) ///{p_end}
{phang2}{space 4}title("Base scheme (gg_hue)"){space 31}///{p_end}
{phang2}{space 4}subtitle("No additional styling"){space 27}///{p_end}
{phang2}{space 4}note("Source: US Census Bureau, Census 2000", span){space 9}///{p_end}
{phang2}{space 4}name(g_base, replace){p_end}

{phang2}* Graph using gg_hue and grstyle refinements{p_end}
{phang2}set scheme gg_hue{p_end}
{phang2}grstyle init{p_end}
{phang2}grstyle set plain, horizontal grid{p_end}
{phang2}grstyle set color navy{p_end}
{phang2}grstyle set color gs12: tick{p_end}
{phang2}grstyle set linewidth 0.2{p_end}
{phang2}grstyle set linewidth .2pt: tick{p_end}
{phang2}grstyle set legend 1{p_end}
{phang2}grstyle set color gs15: legend region{p_end}
{phang2}grstyle set linewidth 1.4pt: legend region outline{p_end}
{phang2}grstyle set symbol O T{p_end}

{phang2}twoway ///{p_end}
{phang2}{space 4}bar maletotal agegrp, horizontal xvarlab(Male) ||{space 11}///{p_end}
{phang2}{space 4}bar femtotal  agegrp, horizontal xvarlab(Female) ||{space 10}///{p_end}
{phang2}{space 4}, ylabel(1(1)17, valuelabel labsize(*.8) angle(0)){space 10}///{p_end}
{phang2}{space 4}xtitle("Population in millions") ytitle(""){space 17}///{p_end}
{phang2}{space 4}xlabel(-10 "10" -7.5 "7.5" -5 "5" -2.5 "2.5" 2.5 5 7.5 10){space 2}///{p_end}
{phang2}{space 4}legend(label(1 Male) label(2 Female) pos(1) ring(0) row(2)) ///{p_end}
{phang2}{space 4}title("Base scheme (gg_hue)"){space 31}///{p_end}
{phang2}{space 4}subtitle("No additional styling"){space 27}///{p_end}
{phang2}{space 4}note("Source: US Census Bureau, Census 2000", span){space 9}///{p_end}
{phang2}{space 4}name(g_base, replace){p_end}

{phang2}* Combine graphs side by side for comparison{p_end}
{phang2}graph combine g_base g_grstyle, ///{p_end}
{phang2}{space 4}col(2) ///{p_end}
{phang2}{space 4}title("Effect of grstyle refinements on a base scheme"){p_end}
{phang2}{* example_end}{...}{p_end}
{phang2}{txt}{...}{p_end}
{phang2}{hline 70}{p_end}
{phang2}{it:({stata "do https://github.com/rampezione/stata-guide/raw/main/guides/do-files/Example__Combining_scheme_and_styling_tool.do":click to run})}{p_end}

{pstd}This combined approach (base scheme + grstyle) avoids the need to create{p_end}
{pstd}a fully custom scheme while still providing fine-grained control over{p_end}
{pstd}the appearance of individual graphs.{p_end}

{hline}

{view "https://github.com/rampezione/stata-guide/raw/main/guides/data-visualization/data-visualization.sthlp":Back to Data Visualization} / {view "https://github.com/rampezione/stata-guide/raw/main/guides/data-visualization/002_univariate_graphs.sthlp":Next (Univariate graphs)}
