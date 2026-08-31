{smcl}
{* *! Stata version 19.5 --- 2026-08-31}{...}

{hilite: Grouped and multivariate graphs}{...}
{right:{view "https://github.com/rampezione/stata-guide/raw/main/guides/data-visualization/data-visualization.sthlp":Back to Data Visualization}}

{hline}
{pstd}Grouped and multivariate graphs extend univariate and bivariate visualizations{p_end}
{pstd}by introducing one or more grouping variables. They are useful for comparing{p_end}
{pstd}distributions, trends, and relationships across categories and can be created{p_end}
{pstd}using commands such as by(), over(), and related options.{p_end}

{dlgtab:Graphs using by()}

{pstd}{bf:Scatterplot by group}{p_end}
{phang2}{stata . webuse auto, clear}{p_end}
{phang2}{stata . twoway scatter mpg weight, by(foreign)}{p_end}

{pstd}With regression line{p_end}
{phang2}{stata . twoway (scatter mpg weight) (lfit mpg weight), by(foreign)}{p_end}

{pstd}{bf:Histogram by group}{p_end}
{phang2}{stata . histogram mpg, by(foreign)}{p_end}

{pstd}{bf:Box plot by group}{p_end}
{phang2}{stata . graph box mpg, by(foreign)}{p_end}

{pstd}{bf:Line plots by group}{p_end}
{phang2}{stata . egen meanmpg = mean(mpg), by(rep78)}{p_end}
{phang2}{stata . twoway line meanmpg weight, by(rep78)}{p_end}

{dlgtab:Graphs using over()}

{pstd}{bf:Bar chart}{p_end}
{phang2}{stata . graph bar mpg, over(foreign)}{p_end}

{pstd}Means by repair record{p_end}
{phang2}{stata . graph bar (mean) mpg, over(rep78)}{p_end}

{pstd}Two grouping variables{p_end}
{phang2}{stata . graph bar (mean) mpg, over(rep78) over(foreign)}{p_end}

{pstd}Horizontal version{p_end}
{phang2}{stata . graph hbar (mean) mpg, over(rep78)}{p_end}

{pstd}{bf:Box plots}{p_end}
{phang2}{stata . graph box mpg, over(rep78)}{p_end}

{pstd}Nested box plots{p_end}
{phang2}{stata . graph box mpg, over(rep78) over(foreign)}{p_end}

{dlgtab:Groups shown in the same graph}

{pstd}{bf:Scatterplot with groups}{p_end}
{phang2}{stata . twoway (scatter mpg weight if foreign==0) (scatter mpg weight if foreign==1), legend(order(1 "Domestic" 2 "Foreign"))}{p_end}

{pstd}Connected lines{p_end}
{phang2}{stata . sort weight}{p_end}
{phang2}{stata . twoway (connected mpg weight if foreign==0) (connected mpg weight if foreign==1)}{p_end}

{pstd}Grouped scatterplot with fitted lines{p_end}
{phang2}{stata . twoway (lfit mpg weight if foreign==0) (lfit mpg weight if foreign==1)}{p_end}
