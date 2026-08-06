{smcl}
{* *! Stata version 19.5 --- 2026-06-08}{...}

{hilite: Bivariate graphs}{...}
{right:{view "https://github.com/rampezione/stata-guide/raw/main/guides/data-visualization/data-visualization.sthlp":← Back to Data Visualization}}

{hline}
{pstd}Bivariate graphs are used to explore the relationship between two variables.{p_end}
{pstd}They provide a natural next step in data analysis by highlighting features such as{p_end}
{pstd}association, trends, group differences, and potential interactions, using plots{p_end}
{pstd}such as scatterplots, grouped box plots, line plots, and related variants.{p_end}

{dlgtab:Two continuous variables}

{pstd}Scatterplot{p_end}
{phang2}{stata . webuse auto, clear}{p_end}
{phang2}{stata . graph matrix mpg price weight}{p_end}
{phang2}{stata . graph matrix mpg price weight, half}{p_end}
{phang2}{stata . graph matrix mpg price weight, half msymbol(T)}{p_end}
{phang2}{stata . graph matrix mpg price weight, half ms(T) maxes(ylab(#4, grid) xlab(#4, grid))}{p_end}

{phang2}{stata . twoway scatter mpg price}{p_end}
{phang2}{stata . twoway scatter mpg price, ms(T) color(red) mlabel(mpg)}{p_end}
{phang2}{stata . twoway scatter mpg price, ms(T) color(red*0.5)}{p_end}
{phang2}{stata . twoway scatter mpg price, ms(T) color("247 141 30")}{p_end}
{phang2}{stata . twoway scatter mpg price, ms(T) mfcolor("255 215 104") mlcolor("247 141 30") msize(large)}{p_end}
{phang2}{stata . twoway scatter mpg price, ms(T) mfcolor("255 215 104") mlcolor("247 141 30") msize(large) || lfit mpg price}{p_end}

{phang2}{stata . twoway connected mpg price, mfcolor("255 215 104") mlcolor("247 141 30") sort(price) lcolor(red)}{p_end}
{phang2}{stata . twoway scatter mpg price, mfcolor("255 215 104") mlcolor("247 141 30") sort(price) lcolor(red) connect(l)}{space 7}{error:// Same than twoway connected}{p_end}
{phang2}{stata . twoway connected mpg price, mfcolor("255 215 104") mlcolor("247 141 30") sort(price) lcolor(red) connect(none)}{space 2}{error:// Same than twoway scatter}{p_end}

{pstd}Two-way line plot with area shading{p_end}
{phang2}{stata . twoway area mpg price, sort(price)}{p_end}
{phang2}{stata . twoway area mpg price, sort(price) xlabel(3000(2000)17000) fcolor("255 215 104") lcolor("247 141 30")}{p_end}
{phang2}{stata . twoway area mpg price, sort(price) xlabel(3000(2000)17000) fcolor("255 215 104") lcolor("247 141 30") base(20)}{p_end}
{phang2}{stata . twoway area mpg price, sort(price) xlabel(10(5)45) ylabel(2000(2000)16000) color("247 141 30") base(20) horizontal}{p_end}

{pstd}Two-way bar{p_end}
{phang2}{stata . sysuse sp500, clear}{p_end}
{phang2}{stata . twoway bar change date}{p_end}
{phang2}{stata . twoway bar change date in 1/60}{space 25}{error:// First 60 days}{p_end}
{phang2}{stata . twoway bar change date in 1/60, fcolor("255 215 104") lcolor("247 141 30")}{p_end}
{phang2}{stata . twoway bar change date in 1/60, fcolor("255 215 104") lcolor("247 141 30") barw(.6)}{p_end}

{pstd}Combined with line plot{p_end}
{phang2}{stata . twoway line close date || bar change date || in 1/60}{p_end}

{pstd}Improved version{p_end}
{phang2}. twoway ///{p_end}
{phang2}{space 4}line close date, yaxis(1) || ///{p_end}
{phang2}{space 4}bar change date, yaxis(2) || in 1/60, ///{p_end}
{phang2}{space 4}ysca(axis(1) r(1000 1400)) ylab(1200(50)1400, axis(1)) ///{p_end}
{phang2}{space 4}ysca(axis(2) r(-50 300)) ylab(-50 0 50, axis(2)) ///{p_end}
{phang2}{space 4}ytick(-50(25)50, axis(2) grid) ///{p_end}
{phang2}{space 4}legend(off) xtitle("Date") title("S&P 500") ///{p_end}
{phang2}{space 4}yline(1150, axis(1) lstyle(foreground)) ///{p_end}
{phang2}{space 4}subtitle("January to March 2001") ///{p_end}
{phang2}{space 4}note("Source: Yahoo!Finance and Commodity Systems, Inc."){p_end}
{phang2}{it:({stata "do https://github.com/rampezione/stata-guide/raw/main/guides/do-files/Example__twoway_line_and_bar.do":click to run})}{p_end}

{dlgtab:More information}

{pstd}Help files{p_end}
{phang2}{stata . help graph matrix}{p_end}
{phang2}{stata . help twoway area}{p_end}
{phang2}{stata . help twoway bar}{p_end}
{phang2}{stata . help twoway connected}{p_end}
{phang2}{stata . help twoway scatter}{p_end}

{pstd}References{p_end}
{phang2}{browse "https://www.stata.com/flyers/stata-cheat-sheets/":Stata cheat sheets by data practitioners Dr. Tim Essam and Dr. Laura Hughes}{p_end}

{hline}

{view "https://github.com/rampezione/stata-guide/raw/main/guides/data-visualization/002_univariate_graphs.sthlp": back (Graphs for one variable)} / {view "https://github.com/rampezione/stata-guide/raw/main/guides/data-visualization/004_grouped_graphs.sthlp":next (Grouped and multivariable graphs)}
