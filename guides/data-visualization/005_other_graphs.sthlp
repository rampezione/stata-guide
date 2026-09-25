{smcl}
{* *! Stata version 19.0 --- 2026-09-24}{...}

{hilite: Other and special-purpose graphs}{...}
{right:{view "https://github.com/rampezione/stata-guide/raw/main/guides/data-visualization/data-visualization.sthlp":Data Visualization}}

{hline}

{pstd}Special-purpose graphs are designed for specific analytical or presentation{p_end}
{pstd}purposes that are not always covered by standard univariate or bivariate plots.{p_end}
{pstd}These graphs can be used to display effect estimates, population structures,{p_end}
{pstd}study participant flow, model results, or other complex information in a{p_end}
{pstd}clear and visually accessible format. Examples include forest plots,{p_end}
{pstd}population pyramids, flowcharts, coefficient plots, and similar customized{p_end}
{pstd}graph types commonly encountered in research reports and scientific publications.{p_end}


{dlgtab:Population pyramid, forest plot}

{pstd}Population pyramid using command bar{p_end}

{phang2}{hline 3} {it:example using bar command} {hline 23}{p_end}
{phang2}{* example_start}{...}{p_end}
{phang2}clear{p_end}
{phang2}sysuse pop2000, clear{p_end}

{phang2}replace maletotal = -maletotal/1e+6{p_end}
{phang2}replace femtotal =  femtotal/1e+6{p_end}

{phang2}set scheme gg_hue{p_end}

{phang2}twoway ///{p_end}
{phang2}{space 4}bar maletotal agegrp, horizontal color(navy%80) lcolor(navy) xvarlab(Male) || ///{p_end}
{phang2}{space 4}bar femtotal agegrp, horizontal color(maroon%80) lcolor(maroon) xvarlab(Female) || ///{p_end}
{phang2}{space 4}, ylabel(1(1)17, valuelabel labsize(*.8) angle(0)) ///{p_end}
{phang2}{space 4}xtitle("Population in millions") ytitle("") ///{p_end}
{phang2}{space 4}xlabel(-10 "10" -7.5 "7.5" -5 "5" -2.5 "2.5" 2.5 5 7.5 10) ///{p_end}
{phang2}{space 4}legend(label(1 Male) label(2 Female) pos(1) ring(0) row(2)) ///{p_end}
{phang2}{space 4}title("Population pyramid") subtitle(". . . subtitle . . .") ///{p_end}
{phang2}{space 4}note("Source: US Census Bureau, Census 2000", span){p_end}
{phang2}{hline 53}{p_end}
{phang2}{it:({stata "do https://github.com/rampezione/stata-guide/raw/main/guides/do-files/Example__Population_pyramid_1.do":click to run})}{p_end}


{pstd}Population pyramid using command pyramid_chart. Note! This user-written command{p_end}
{pstd}displays relative distributions (%) only and does not support absolute population{p_end} 
{pstd}counts. The dataset should contain one numeric variable (varname) and two{p_end} 
{pstd}categorical variables specified in over() and by(). The data must also be in long{p_end} 
{pstd}format: if stored in wide format, reshape the data before running pyramid_chart.{p_end}

{hline}

{view "https://github.com/rampezione/stata-guide/raw/main/guides/data-visualization/004_grouped_graphs.sthlp":Back to grouped graphs} / {view "https://github.com/rampezione/stata-guide/raw/main/guides/data-visualization/006_graph_editor.sthlp":Next (Graph editor)}
