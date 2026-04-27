{smcl}
{* *! Stata version 19.5 --- 2026-04-27}{...}

{hilite: Univariate graphs}{...}
{right:{view "https://github.com/rampezione/stata-guide/raw/main/guides/data-visualization/data-visualization.sthlp":← Back to Data Visualization}}

{hline}

{pstd}Univariate graphs are used to explore the distribution and key properties of a single{p_end}
{pstd}variable. They provide a natural starting point for data analysis by highlighting{p_end}
{pstd}features such as central tendency, variability, skewness, and potential outliers,{p_end}
{pstd}using plots such as histograms, density plots, box plots, and related variants.{p_end}


{dlgtab:Continuous variable}

{pstd}Histogram{p_end}
{phang2}{stata . webuse auto, clear}{p_end}
{phang2}{stata . histogram mpg}{p_end}
{phang2}{stata . histogram mpg, bin(5)}{p_end}
{phang2}{stata . histogram mpg, bin(5) normal}{p_end}
{phang2}{stata . histogram mpg, bin(5) normal fcolor("128 195 66") lcolor("53 119 106") ylabel(, angle(0))}{p_end}

{pstd}Kernel density plot{p_end}
{phang2}{stata . kdensity mpg}{p_end}
{phang2}{stata . kdensity mpg, bwidth(10)}{p_end}
{phang2}{stata . kdensity mpg, bwidth(10) kernel(parzen)}{p_end}

{pstd}Histogram + kernel density plot{p_end}
{phang2}{stata . kdensity mpg, addplot(histogram mpg)}{p_end}
{phang2}{stata . kdensity mpg, addplot(histogram mpg) bwidth(5)}{p_end}
{phang2}{stata "do https://github.com/rampezione/stata-guide/raw/main/guides/do-files/Data_visualization__Histogram1.do":. kdensity mpg, addplot(histogram mpg, fcolor("255 215 104") lcolor("247 141 30")) ///}{p_end}
{phang2}{stata "do https://github.com/rampezione/stata-guide/raw/main/guides/do-files/Data_visualization__Histogram1.do":{space 4}bwidth(5) kernel(biweight) legend(rows(1))}{p_end}

{pstd}Equal probability histogram: each bar represents the same proportion{p_end}
{pstd}of the data, leading to unequal bin widths in most real-world datasets.{p_end}
{phang2}{stata . ssc install eqprhistogram, replace}{p_end}
{phang2}{stata . eqprhistogram mpg}{p_end}
{phang2}{stata . eqprhistogram mpg, bin(4)}{p_end}
{phang2}{stata . eqprhistogram mpg, bin(10) plot(kdensity mpg)}{p_end}

{pstd}Box plot{p_end}
{phang2}{stata . graph box mpg}{p_end}
{phang2}{stata . graph hbox mpg}{p_end}
{phang2}{stata . graph hbox mpg, ylabel(0(5)40) cwhiskers intensity(*0.5) lintensity(*1.5)}{p_end}

{pstd}Quantile plot{p_end}
{phang2}{stata ". net install gr42_9, from(http://www.stata-journal.com/software/sj24-4) replace"}{p_end}
{phang2}{stata . qplot price}{p_end}
{phang2}{stata . qplot price, aspect(1)}{p_end}
{phang2}{stata . qplot price, aspect(1) recast(bar) barwidth(`=1/74') base(0)}{p_end}

{pstd}Cumulative distribution{p_end}
{phang2}{stata ". net install cdfplot, from(http://fmwww.bc.edu/RePEc/bocode/c) replace"}{p_end}
{phang2}{stata . cdfplot mpg}{p_end}
{phang2}{stata . cdfplot mpg, normal}{p_end}

{pstd}Oneway dot plot{p_end}
{phang2}{stata ". net install stripplot, from(http://fmwww.bc.edu/RePEc/bocode/s) replace"}{p_end}
{phang2}{stata . stripplot price}{p_end}
{phang2}{stata . stripplot price, vertical ytitle("Price") ylabel(,angle(0)) scheme(s1mono) plotregion(lstyle(none))}{p_end}
{phang2}{stata . stripplot price, vertical ytitle("Price") ylabel(,angle(0)) scheme(s1mono) plotregion(lstyle(none)) jitter(8 1)}{p_end}

{phang2}{stata . dotplot price, ny(20) ytitle("HPrice") ylabel(,angle(0)) scheme(s1mono)  plotregion(lstyle(none))}{p_end}

{phang2}{stata . graph dot (mean) mpg}{p_end}
{phang2}{stata . graph dot (mean) mpg trunk turn}{p_end}
{phang2}{stata . graph dot (mean) mpg trunk turn, ascategory}{p_end}

{pstd}Violin plot{p_end}
{phang2}{stata . ssc install vioplot, replace}{p_end}
{phang2}{stata . vioplot mpg}{p_end}
{phang2}{stata . vioplot mpg, obs ylabel(0(5)45, angle(0)) scheme(s2color)}{p_end}
{phang2}{stata . vioplot mpg, xlabel(0(5)45) horizontal scheme(s2color)}{p_end}


{dlgtab:Discrete variable}

{pstd}Bar chart{p_end}
{phang2}{stata . graph bar, over(rep78)}{p_end}
{phang2}{stata . graph bar, over(rep78, gap(*0.5)) intensity(*0.5)}{p_end}
{phang2}{stata . graph bar (mean) mpg, over(rep78) over(foreign) asyvars percentages legend(rows(1) ring(0) pos(12)) nofill scheme(s2color) bargap(6)}{p_end}
{phang2}{stata . graph hbar, over(foreign)}{p_end}
{phang2}{stata . graph hbar (count), over(foreign)}{p_end}
{phang2}{stata . graph hbar (count), over(rep78) over(foreign)}{p_end}
{phang2}{stata . graph hbar (mean) mpg trunk, over(foreign) percentages stack}{p_end}

{pstd}Catplot{p_end}
{phang2}{stata . ssc install catplot, replace}{p_end}
{phang2}{stata . catplot, over(rep78)}{p_end}
{phang2}{stata . catplot, over(rep78) percent}{p_end}
{phang2}{stata . catplot, over(rep78) over(foreign) percent(foreign)}{p_end}
{phang2}{stata . catplot, over(rep78) over(foreign) percent(foreign) stack asyvars legend(rows(1) ring(0) pos(12)) bar(1, bcolor("0 121 154")) bar(2, bcolor("53 119 106")) bar(3, bcolor("128 195 66")) bar(4, bcolor("247 141 30")) bar(5, bcolor("255 215 104"))}{p_end}
{phang2}{stata . catplot, by(foreign, l1title(Repair record 1978)) over(rep78) percent(rep78) blabel(bar, format(%02.0f)) ysc(r(0 105))}{p_end}

{pstd}Tabplot{p_end}
{phang2}{stata . ssc install tabplot}{p_end}
{phang2}{stata . tabplot rep78}{p_end}
{phang2}{stata . tabplot rep78, showval horizontal}{p_end}
{phang2}{stata . tabplot foreign rep78, percent(foreign) sep(foreign) bar1(bcolor("53 119 106")) bar2(bcolor("247 141 30")) showval(offset(0.05) format(%2.1f)) subtitle(% by origin)}{p_end}


{dlgtab:Discrete X, continuous Y}

{pstd}Histogram{p_end}
{phang2}{stata . histogram mpg, bin(5) normal by(foreign) ylabel(, angle(0)) legend(rows(1) ring(1))}{p_end}

{pstd}Box plot{p_end}
{phang2}{stata . graph hbox mpg, ylabel(0(5)40) over(rep78)}{p_end}
{phang2}{stata . graph hbox mpg, ylabel(0(5)40) over(rep78) over(foreign) scheme(s2color) nofill}{p_end}
{phang2}{stata . graph hbox mpg, over(rep78) over(foreign) asyvars title("Box plot of mileage by repair record and origin") legend(rows(1) position(12))}{p_end}

{pstd}Cumulative distribution{p_end}
{phang2}{stata . cdfplot mpg, normal by(foreign) opt1(lc(red green)) opt2(lp(dash dash))}{p_end}

{pstd}Oneway dot plot{p_end}
{phang2}{stata . stripplot price, vertical ytitle("Price") ylabel(,angle(0)) scheme(s1mono) plotregion(lstyle(none)) stack width(500) ms(T) over(foreign)}{p_end}

{phang2}{stata . dotplot price, ny(20) ytitle("HPrice") ylabel(,angle(0)) scheme(s1mono)  plotregion(lstyle(none)) over(foreign) ytitle("Price")}{p_end}

{phang2}{stata . graph dot (mean) mpg, over(rep78) over(foreign) scheme(s2color)}{p_end}
{phang2}{stata . graph dot (mean) mpg, over(rep78) groupyvars scheme(s2color) legend(rows(1) ring(0) pos(12))}{p_end}

{pstd}Violin plot{p_end}
{phang2}{stata . vioplot mpg, over(rep78) over(foreign) title("Violin Plot of Mileage") subtitle("By repair record") scheme(s2color)}{p_end}
{phang2}{stata . vioplot mpg trunk, over(foreign) scheme(s2color) horizontal ytitle("Repair record") ylab(,angle(horiz))}{p_end}


{dlgtab:More information}

{pstd}Help files{p_end}
{phang2}{stata . help catplot}{p_end}
{phang2}{stata . help cdfplot}{p_end}
{phang2}{stata . help dotplot}{p_end}
{phang2}{stata . help eqprhistogram}{p_end}
{phang2}{stata . help graph bar}{p_end}
{phang2}{stata . help graph box}{p_end}
{phang2}{stata . help graph dot}{p_end}
{phang2}{stata . help histogram}{p_end}
{phang2}{stata . help kdensity}{p_end}
{phang2}{stata . help qplot}{p_end}
{phang2}{stata . help stripplot}{p_end}
{phang2}{stata . help tabplot}{p_end}
{phang2}{stata . help vioplot}{p_end}

{pstd}References{p_end}
{phang2}{browse "https://www.stata.com/flyers/stata-cheat-sheets/":Stata cheat sheets by data practitioners Dr. Tim Essam and Dr. Laura Hughes}{p_end}
{phang2}{browse "https://wlm.userweb.mwn.de/Stata/wstatbas.htm":Internet Guide to Stata by Wolfgang Ludwig-Mayerhofer}{p_end}


{hline}

{view "https://github.com/rampezione/stata-guide/raw/main/guides/data-visualization/data-visualization.sthlp":← Back to Data Visualization} / {view "https://github.com/rampezione/stata-guide/raw/main/guides/data-visualization/003_bivariate_graphs.sthlp":next (Univariate graphs)}
