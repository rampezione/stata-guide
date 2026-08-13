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

{pstd}{bf:Scatterplot}{p_end}
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

{pstd}{bf:Two-way line plot with area shading}{p_end}
{phang2}{stata . twoway area mpg price, sort(price)}{p_end}
{phang2}{stata . twoway area mpg price, sort(price) xlabel(3000(2000)17000) fcolor("255 215 104") lcolor("247 141 30")}{p_end}
{phang2}{stata . twoway area mpg price, sort(price) xlabel(3000(2000)17000) fcolor("255 215 104") lcolor("247 141 30") base(20)}{p_end}
{phang2}{stata . twoway area mpg price, sort(price) xlabel(10(5)45) ylabel(2000(2000)16000) color("247 141 30") base(20) horizontal}{p_end}

{pstd}{bf:Two-way bar plot}{p_end}
{phang2}{stata . sysuse sp500, clear}{p_end}
{phang2}{stata . twoway bar change date}{space 11}{error:// All observations}{p_end}
{phang2}{stata . twoway bar change date in 1/60}{space 3}{error:// First 60 days}{p_end}
{phang2}{stata . twoway bar change date in 1/60, fcolor("255 215 104") lcolor("247 141 30")}{p_end}
{phang2}{stata . twoway bar change date in 1/60, fcolor("255 215 104") lcolor("247 141 30") barw(.6)}{p_end}

{pstd}Combined with line plot{p_end}
{phang2}{stata . twoway line close date || bar change date || in 1/60}{p_end}

{pstd}Improved version{p_end}
{phang2}{stata "do https://github.com/rampezione/stata-guide/raw/main/guides/do-files/Data_visualization__Twoway_line_and_bar.do":. twoway ///}{p_end}
{phang2}{stata "do https://github.com/rampezione/stata-guide/raw/main/guides/do-files/Data_visualization__Twoway_line_and_bar.do":{space 4}line close date, yaxis(1) lcolor(#3d34a3) ///}{p_end}
{phang2}{stata "do https://github.com/rampezione/stata-guide/raw/main/guides/do-files/Data_visualization__Twoway_line_and_bar.do":{space 4}|| bar change date, yaxis(2) color("255 215 104") lcolor("247 141 30") ///}{p_end}
{phang2}{stata "do https://github.com/rampezione/stata-guide/raw/main/guides/do-files/Data_visualization__Twoway_line_and_bar.do":{space 4}|| in 1/60, ///}{p_end}
{phang2}{stata "do https://github.com/rampezione/stata-guide/raw/main/guides/do-files/Data_visualization__Twoway_line_and_bar.do":{space 4}ysca(axis(1) r(1000 1400)) ylab(1200(50)1400, axis(1)) ///}{p_end}
{phang2}{stata "do https://github.com/rampezione/stata-guide/raw/main/guides/do-files/Data_visualization__Twoway_line_and_bar.do":{space 4}ysca(axis(2) r(-50 300)) ylab(-50 0 50, axis(2)) ///}{p_end}
{phang2}{stata "do https://github.com/rampezione/stata-guide/raw/main/guides/do-files/Data_visualization__Twoway_line_and_bar.do":{space 4}ytick(-50(25)50, axis(2) grid) ///}{p_end}
{phang2}{stata "do https://github.com/rampezione/stata-guide/raw/main/guides/do-files/Data_visualization__Twoway_line_and_bar.do":{space 4}legend(off) xtitle("Date") title("S&P 500") ///}{p_end}
{phang2}{stata "do https://github.com/rampezione/stata-guide/raw/main/guides/do-files/Data_visualization__Twoway_line_and_bar.do":{space 4}yline(1150, axis(1) lstyle(foreground)) ///}{p_end}
{phang2}{stata "do https://github.com/rampezione/stata-guide/raw/main/guides/do-files/Data_visualization__Twoway_line_and_bar.do":{space 4}subtitle("January to March 2001") ///}{p_end}
{phang2}{stata "do https://github.com/rampezione/stata-guide/raw/main/guides/do-files/Data_visualization__Twoway_line_and_bar.do":{space 4}note("Source: Yahoo!Finance and Commodity Systems, Inc.")}{p_end}

{pstd}{bf:Two-way dot plot}{p_end}
{phang2}{stata . sysuse sp500, clear}{p_end}
{phang2}{stata . twoway dot change date in 1/60}{space 17}{error:// First 60 days}{p_end}
{phang2}{stata . twoway dot change date in 1/60, dotext(n)}{space 6}{error:// To prevent the dots from extending across the range of y}{p_end}
{phang2}{stata . twoway dot change date in 1/60, horizontal}{p_end}

{pstd}{bf:Two-way dropped-line plot}{p_end}
{phang2}{stata . twoway dropline change date in 1/60}{p_end}
{phang2}{stata . twoway dropline change date in 1/60, yline(0, lstyle(foreground))}{p_end}

{pstd}With labeled points{p_end}
{phang2}{stata "do https://github.com/rampezione/stata-guide/raw/main/guides/do-files/Data_visualization__Twoway_dropline_with_labels.do":. sysuse lifeexp, clear}{p_end}
{phang2}{stata "do https://github.com/rampezione/stata-guide/raw/main/guides/do-files/Data_visualization__Twoway_dropline_with_labels.do":. keep if region==3}{p_end}
{phang2}{stata "do https://github.com/rampezione/stata-guide/raw/main/guides/do-files/Data_visualization__Twoway_dropline_with_labels.do":. generate lngnp = ln(gnppc)}{p_end}
{phang2}{stata "do https://github.com/rampezione/stata-guide/raw/main/guides/do-files/Data_visualization__Twoway_dropline_with_labels.do":. quietly regress lexp lngnp}{p_end}
{phang2}{stata "do https://github.com/rampezione/stata-guide/raw/main/guides/do-files/Data_visualization__Twoway_dropline_with_labels.do":. predict r, resid}{p_end}
{phang2}{space 4}{p_end}
{phang2}{stata "do https://github.com/rampezione/stata-guide/raw/main/guides/do-files/Data_visualization__Twoway_dropline_with_labels.do":. twoway dropline r gnppc, yline(0, lstyle(foreground)) lcolor("247 141 30") ///}{p_end}
{phang2}{stata "do https://github.com/rampezione/stata-guide/raw/main/guides/do-files/Data_visualization__Twoway_dropline_with_labels.do":{space 4}ylab(-6(1)6) mlabel(country) mlabpos(9) mfcolor("255 215 104") mlcolor("247 141 30") ///}{p_end}
{phang2}{stata "do https://github.com/rampezione/stata-guide/raw/main/guides/do-files/Data_visualization__Twoway_dropline_with_labels.do":{space 4}subtitle("Regression of life expectancy on ln(gnp)", pos(11)) ///}{p_end}
{phang2}{stata "do https://github.com/rampezione/stata-guide/raw/main/guides/do-files/Data_visualization__Twoway_dropline_with_labels.do":{space 4}note("Residuals in years; positive values indicate" ///}{p_end}
{phang2}{stata "do https://github.com/rampezione/stata-guide/raw/main/guides/do-files/Data_visualization__Twoway_dropline_with_labels.do":{space 4}"longer than predicted life expectancy")}{p_end}

{pstd}{bf:Range plot with capped spikes}{p_end}
{phang2}{stata . sysuse sp500, clear}{p_end}
{phang2}{stata . twoway rcap high low date in 1/37}{p_end}
{phang2}{stata . twoway rcap high low date || scatter close date || in 1/37, legend(position(6) ring(0))}{space 5}{error:// Combined with a scatterplot to produce hi-lo-middle graph}{p_end}
{phang2}{stata . twoway rcap high low date || scatter close date || in 1/37, legend(position(6) ring(0) region(lcolor(black) fcolor(#F0F0F0)))}{p_end}

{pstd}Range plot with spikes capped with marker symbols{p_end}
{phang2}{stata . twoway rcapsym high low date in 1/37}{space 5}{error:// Default symbol is circle}{p_end}
{phang2}{stata . twoway rcapsym high low date in 1/37, lcolor(orange)}{p_end}
{phang2}{stata . twoway rcapsym high low date in 1/37, lcolor(orange) msymbol(diamond_hollow)}{p_end}

{pstd}{bf:Range plot with area shading}{p_end}
{phang2}{stata . twoway rarea high low date in 1/37}{p_end}

{pstd}{bf:Range plot with bars}{p_end}
{phang2}{stata . twoway rbar high low date in 1/37}{p_end}
{phang2}{stata . twoway rbar high low date in 1/37, barwidth(.6)}{p_end}

{pstd}Combined with line plot{p_end}
{phang2}{stata "do https://github.com/rampezione/stata-guide/raw/main/guides/do-files/Data_visualization__Twoway_rbar1.do":. twoway rbar high low date, barwidth(.6) fcolor("255 215 104") lcolor("247 141 30") ///}{p_end}
{phang2}{stata "do https://github.com/rampezione/stata-guide/raw/main/guides/do-files/Data_visualization__Twoway_rbar1.do":{space 4}|| line close date, lcolor(#3d34a3) ///}{p_end}
{phang2}{stata "do https://github.com/rampezione/stata-guide/raw/main/guides/do-files/Data_visualization__Twoway_rbar1.do":{space 4}|| in 1/37, ///}{p_end}
{phang2}{stata "do https://github.com/rampezione/stata-guide/raw/main/guides/do-files/Data_visualization__Twoway_rbar1.do":{space 4}legend(position(6) ring(0) region(lcolor(black) fcolor(#F0F0F0)))}{p_end}

{pstd}Same but now the bars would be drawn over line{p_end}
{phang2}{stata "do https://github.com/rampezione/stata-guide/raw/main/guides/do-files/Data_visualization__Twoway_rbar2.do":. twoway line close date, lcolor(#3d34a3) ///}{p_end}
{phang2}{stata "do https://github.com/rampezione/stata-guide/raw/main/guides/do-files/Data_visualization__Twoway_rbar2.do":{space 4}|| rbar high low date, barwidth(.6) fcolor("255 215 104") lcolor("247 141 30") ///}{p_end}
{phang2}{stata "do https://github.com/rampezione/stata-guide/raw/main/guides/do-files/Data_visualization__Twoway_rbar2.do":{space 4}|| in 1/37, ///}{p_end}
{phang2}{stata "do https://github.com/rampezione/stata-guide/raw/main/guides/do-files/Data_visualization__Twoway_rbar2.do":{space 4}legend(position(6) ring(0) region(lcolor(black) fcolor(#F0F0F0)))}{p_end}

{pstd}{bf:Paired-coordinate plot with spikes}{p_end}
{pstd}A paired-coordinate spike plot draws a spike (or line) for each observation in the dataset. The line starts at the coordinate (y1var,x1var) and ends at the coordinate (y2var,x2var).{p_end}
{phang2}{stata . sysuse nlswide1, clear}{p_end}
{phang2}{stata . list occ wage68 ttl_exp68 wage88 ttl_exp88}{p_end}
{phang2}{stata . twoway pcspike wage68 ttl_exp68 wage88 ttl_exp88}{p_end}

{pstd}Combined with a twoway scatter plot with the addition of labeled markers.{p_end}
{phang2}{stata "do https://github.com/rampezione/stata-guide/raw/main/guides/do-files/Data_visualization__Twoway_pcspike_with_scatter.do":. twoway pcspike wage68 ttl_exp68 wage88 ttl_exp88 ///}{p_end}
{phang2}{stata "do https://github.com/rampezione/stata-guide/raw/main/guides/do-files/Data_visualization__Twoway_pcspike_with_scatter.do":{space 4}|| scatter wage68 ttl_exp68, msym(O) ///}{p_end}
{phang2}{stata "do https://github.com/rampezione/stata-guide/raw/main/guides/do-files/Data_visualization__Twoway_pcspike_with_scatter.do":{space 4}|| scatter wage88 ttl_exp88, msym(O) pstyle(p4) ///}{p_end}
{phang2}{stata "do https://github.com/rampezione/stata-guide/raw/main/guides/do-files/Data_visualization__Twoway_pcspike_with_scatter.do":{space 4}mlabel(occ) xscale(range(17)) ///}{p_end}
{phang2}{stata "do https://github.com/rampezione/stata-guide/raw/main/guides/do-files/Data_visualization__Twoway_pcspike_with_scatter.do":{space 4}title("Change in US women's experience and earnings") ///}{p_end}
{phang2}{stata "do https://github.com/rampezione/stata-guide/raw/main/guides/do-files/Data_visualization__Twoway_pcspike_with_scatter.do":{space 4}subtitle("by occupation, 1968 to 1988") ///}{p_end}
{phang2}{stata "do https://github.com/rampezione/stata-guide/raw/main/guides/do-files/Data_visualization__Twoway_pcspike_with_scatter.do":{space 4}ytitle(Earnings) xtitle(Total experience) ///}{p_end}
{phang2}{stata "do https://github.com/rampezione/stata-guide/raw/main/guides/do-files/Data_visualization__Twoway_pcspike_with_scatter.do":{space 4}note("Source: National Longitudinal Survey of Young Women") ///}{p_end}
{phang2}{stata "do https://github.com/rampezione/stata-guide/raw/main/guides/do-files/Data_visualization__Twoway_pcspike_with_scatter.do":{space 4}legend(order(2 "1968" 3 "1988"))}{p_end}


{dlgtab:More information}

{pstd}Help files{p_end}
{phang2}{stata . help graph matrix}{p_end}
{phang2}{stata . help twoway}{p_end}
{phang2}{stata . help twoway area}{p_end}
{phang2}{stata . help twoway bar}{p_end}
{phang2}{stata . help twoway connected}{p_end}
{phang2}{stata . help twoway dot}{p_end}
{phang2}{stata . help twoway dropline}{p_end}
{phang2}{stata . help twoway pcspike}{p_end}
{phang2}{stata . help twoway rarea}{p_end}
{phang2}{stata . help twoway rbar}{p_end}
{phang2}{stata . help twoway rcap}{p_end}
{phang2}{stata . help twoway rcapsym}{p_end}
{phang2}{stata . help twoway scatter}{p_end}

{pstd}References{p_end}
{phang2}{browse "https://www.stata.com/flyers/stata-cheat-sheets/":Stata cheat sheets by data practitioners Dr. Tim Essam and Dr. Laura Hughes}{p_end}

{hline}

{view "https://github.com/rampezione/stata-guide/raw/main/guides/data-visualization/002_univariate_graphs.sthlp": back (Graphs for one variable)} / {view "https://github.com/rampezione/stata-guide/raw/main/guides/data-visualization/004_grouped_graphs.sthlp":next (Grouped and multivariable graphs)}
