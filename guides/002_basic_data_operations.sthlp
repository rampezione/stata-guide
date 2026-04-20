{smcl}
{* *! Stata version 19.5 --- 2025-08-19}{...}

{hilite: Basic data operations}{...}
{right:{view "https://github.com/rampezione/stata-guide/raw/main/guides/data-processing.sthlp":Data processing}}

{hline}

{cmd:{dlgtab:Arithmetic operations}}

{pstd}The {it:arithmetic operators} in Stata are addition, subtraction, multiplication, division,{p_end}
{pstd}raise to a power, and the prefix - (negation). Any arithmetic operation on a missing value{p_end}
{pstd}or an impossible arithmetic operation (such as division by zero) yields a missing value.{p_end}
{pstd}(ref: {browse "https://www.stata.com/manuals/u.pdf":Stata user's guide (pdf)}){p_end}

{phang2}--------------------------------------------------------------------------{p_end}
{phang2}{space 1}{bf:Operation}{space 12}{bf:Symbol}{space 5}{bf:Description}{p_end}
{phang2}--------------------------------------------------------------------------{p_end}
{phang2}{space 1}Add{space 18}+{space 10}Adds numbers or concatenates strings{p_end}
{phang2}{space 1}Subtract{space 13}-{space 10}Subtracts numbers{p_end}
{phang2}{space 1}Multiply{space 13}*{space 10}Multiplies numbers or dublicates strings{p_end}
{phang2}{space 1}Divide{space 15}/{space 10}Divides numbers{p_end}
{phang2}{space 1}Raise to a power{space 5}^{space 10}Raises a number to a power{p_end}
{phang2}{space 1}Negation{space 13}-{space 10}Reverses the sign of a number or sorts{p_end}
{phang2}{space 33}in descending order (e.g., . gsort -age){p_end}
{phang2}--------------------------------------------------------------------------{p_end}

{pstd}Examples{p_end} 
{phang2}{stata . display 2+2}{p_end}
{phang2}{stata . disp 2-2}{p_end}
{phang2}{stata . di 2*2}{p_end}

{phang2}{stata . webuse auto, clear}{p_end}
{phang2}{stata . generate PriceMpg = price / mpg}{p_end}
{phang2}{stata . summarize PriceMpg}{p_end}

{phang2}{stata . ge StrVar = "this"+" "+"that"}{p_end}
{phang2}{stata . di StrVar}{p_end}

{phang2}{stata . ge StrVar2 = "this"*3}{p_end}
{phang2}{stata . di StrVar2}{p_end} 
{pstd}Note! Stata allows abbreviations of commands as long as the abbreviation is unique.{p_end}
{pstd}For example, di = disp = display, ge = gen = generate, su = summ = summarize.{p_end}


{cmd:{dlgtab:Relational operations}}

{pstd}The {it:relational operators} in Stata are "greater than", "less than", "greater than or equal",{p_end}
{pstd}"less than or equal", "equal", and "not equal". Observe that the relational operator for{p_end}
{pstd}equality is a pair of equal signs. This convention distinguishes relational equality from{p_end}
{pstd}the =exp assignment phrase. (ref: {browse "https://www.stata.com/manuals/u.pdf":Stata user's guide (pdf)}){p_end}

{phang2}-------------------------------------------------------------------------------{p_end}
{phang2}{space 1}{bf:Operation}{space 16}{bf:Symbol(s)}{space 5}{bf:Description}{p_end}
{phang2}-------------------------------------------------------------------------------{p_end}
{phang2}{space 1}Greater than{space 13}>{space 13}Tests if value is greater than another{p_end}
{phang2}{space 1}Less than{space 16}<{space 13}Tests if value is less than another{p_end}
{phang2}{space 1}Greater than or equal{space 4}>={space 12}Tests if value is greater or equal{p_end}
{phang2}{space 1}Less than or equal{space 7}<={space 12}Tests if value is less or equal{p_end}
{phang2}{space 1}Equal{space 20}=={space 12}Tests if values are equal{p_end}
{phang2}{space 1}Not equal{space 16}!= (or ~=){space 4}Tests if values are not equal{p_end}
{phang2}-------------------------------------------------------------------------------{p_end}

{pstd}Examples{p_end} 
{phang2}{stata . display 2>3}{p_end}
{phang2}{stata . disp 2<3}{p_end}

{phang2}{stata . di 2!=3}{p_end}
{phang2}{stata . di 2~=3}{p_end}

{phang2}{stata . list make price mpg PriceMpg if foreign==1}{p_end}
{phang2}{stata . list make price mpg PriceMpg if foreign!=0}{p_end}
{phang2}{stata . list make price mpg PriceMpg if price<=4060}{p_end} 
{pstd}Note! ! and ~ are interchangeable for the logical operator "not".{p_end}
{pstd}Therefore, the "not equal" operator may also be written as ~=.{p_end}


{cmd:{dlgtab:Logical operations}}

{pstd}The {it:logical operators} in Stata are & (and), | (or), and ! (not). The logical operators{p_end}
{pstd}interpret any nonzero value (including missing) as true and zero as {it:false}.{p_end}
{pstd}(ref: {browse "https://www.stata.com/manuals/u.pdf":Stata user's guide (pdf)}){p_end}

{phang2}---------------------------------------------------------------------{p_end}
{phang2}{space 1}{bf:Operation}{space 9}{bf:Symbol(s)}{space 5}{bf:Description}{p_end}
{phang2}---------------------------------------------------------------------{p_end}
{phang2}{space 1}And{space 15}&{space 13}Both conditions must be true{p_end}
{phang2}{space 1}Or{space 16}|{space 13}At least one condition must be true{p_end}
{phang2}{space 1}Not{space 15}! or ~{space 8}Negates a condition{p_end}
{phang2}---------------------------------------------------------------------{p_end}

{pstd}Examples{p_end} 
{phang2}{stata . list make price mpg PriceMpg if foreign==1 & price<=4000}{p_end}
{phang2}{stata . list make price mpg PriceMpg if foreign==1 & (price<=4000 | price>=11000) & price<.}{p_end} 
{pstd}Note! The order of evaluation (from first to last) of all operators is ! (or ~), ^,{p_end}
{pstd}- (negation), /, *, - (subtraction), +, != (or ~=), >, <, <=, >=, ==, &, and |.{p_end}


{hline}

{view "https://github.com/rampezione/stata-guide/raw/main/guides/001_shortcuts.sthlp": back (Useful shortcuts)} / {view "https://github.com/rampezione/stata-guide/raw/main/guides/003_setup.sthlp":next (Setup)}
