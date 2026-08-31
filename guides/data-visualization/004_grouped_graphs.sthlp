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

{pstd}{bf:Scatterplot}{p_end}
{phang2}{stata . webuse auto, clear}{p_end}
{phang2}{stata . twoway scatter mpg weight, by(foreign)}{p_end}

