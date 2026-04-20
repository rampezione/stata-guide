{smcl}
{* *! Stata version 19.5 --- 2026-04-20}{...}

{hilite: New variables}{...}
{right:{view "https://github.com/rampezione/stata-guide/raw/main/guides/data-processing/data-processing.sthlp":Data processing}}

{hline}

{pstd}Open the sample dataset{p_end}
{phang2}{stata . sysuse auto, clear}


{dlgtab:Creating new variables}

{pstd}Generate new variable{p_end}
{phang2}{stata . generate mpg_sq = mpg*mpg}{p_end}
{phang2}{stata . generate mpg_sq_v2 = mpg^2}{p_end}
{phang2}{stata . tabstat mpg_sq mpg_sq_v2, stats(n mean sd med min max)}{p_end}

{pstd}Generate new dummy variable using two commands or just one{p_end}
{phang2}{stata . generate byte price_5k = 0 if price<5000}{p_end}
{phang2}{stata . replace price_5k = 1 if price>=5000 & price<.}{p_end}
{phang2}{stata . tab price_5k}{p_end}

{phang2}{stata . gen byte price_under5k = (price<5000)}{p_end}
{phang2}{stata . tab price_5k}{p_end}

{pstd}Generate new categorical variable using several commands or just one{p_end}
{phang2}{stata . generate price_cat = 0 if price<4200}{p_end}
{phang2}{stata . replace price_cat = 1 if price>=4200 & price<5000}{p_end}
{phang2}{stata . replace price_cat = 2 if price>=5000 & price<6399}{p_end}
{phang2}{stata . replace price_cat = 3 if price>=6400 & price<.}{p_end}
{phang2}{stata . label define p4 0 "<4200" 1 "4200-4999" 2 "5000-6399" 3 "6400+"}{p_end}
{phang2}{stata . label values price_cat p4}{p_end}
{phang2}{stata . tab price_cat}{p_end}

{phang2}{stata . gen price_cat_v2 = (price>=4200) + (price>=5000) + (price>=6400) if price<.}{p_end}
{phang2}{stata . label values price_cat_v2 p4}{p_end}
{phang2}{stata . tab price_cat_v2}{p_end}

{pstd}Generate a running index of observations{p_end}
{phang2}{stata . gen id = _n}{p_end}
{phang2}{stata . list make price price_cat id in 1/10, noobs}{p_end}
{phang2}{stata . list make price price_cat id in -10/-1, noobs}{p_end}

{pstd}Generate a running index of observations in a group{p_end}
{phang2}{stata ". bysort rep78: gen repairidx = _n"}{p_end}
{phang2}{stata ". by foreign, sort: list price foreign meanPrice meanPriceForeign if id>=49 & id<=56, noobs separator(4)"}{p_end}

{pstd}Generate a running count of the total observations and per group{p_end}
{phang2}{stata . gen totRows = _N}{p_end}
{phang2}{stata . di totRows}{p_end}

{phang2}{stata ". bysort rep78: gen repairTot = _N"}{p_end}
{phang2}{stata . table rep78, statistic(count repairTot)}{p_end}

{pstd}Generate new categorical variable using egen (extensions to generate){p_end}
{phang2}{stata . egen price_cat_egen = cut(price), at(0, 4200, 5000, 6400, 999999) label}{p_end}
{phang2}{stata . tab price_cat_egen}{p_end}
{phang2}{stata . label values price_cat_egen p4}{p_end}
{phang2}{stata . tab price_cat price_cat_egen}{p_end}

{pstd}Calculating mean price for the whole data and for each group in foreign{p_end}
{phang2}{stata . egen meanPrice = mean(price)}{p_end}
{phang2}{stata . egen meanPriceForeign = mean(price), by(foreign)}{p_end}
{phang2}{stata . list price_cat price_cat_egen foreign meanPrice meanPriceForeign if _n<=5 | _n>=70, noobs}{p_end}


{dlgtab:Recoding new variables}

{phang2}{stata . recode price (min/4199 = 0) (4200/4999 = 1) (5000/6399 = 2) (6400/max = 3), gen(price_cat_recode)}{p_end}
{phang2}{stata . label values price_cat_recode p4}{p_end}
{phang2}{stata . tab price_cat price_cat_recode}{p_end}

{pstd}{error: {bf:Note on numeric precision:}}{p_end}
{pstd}When creating categories based on cut-points, be aware of floating-point precision. Values{p_end}
{pstd}that appear to equal a cut-point may be stored slightly below or above the threshold in memory,{p_end}
{pstd}which can affect classification. For details, see the discussion on numeric storage types and rounding:{view "https://github.com/rampezione/stata-guide/raw/main/guides/data-processing/006_data_types.sthlp": float}{p_end}


{dlgtab:more information}

{phang2}{stata . help generate}{p_end}
{phang2}{stata . help egen}{p_end}
{phang2}{stata . help recode}{p_end}


{hline}

{view "https://github.com/rampezione/stata-guide/raw/main/guides/data-processing/007_summarize.sthlp": back (Summarize data)} / {view "https://github.com/rampezione/stata-guide/raw/main/guides/data-transformation/001_subsetting.sthlp": next (Subsetting data)}
 
