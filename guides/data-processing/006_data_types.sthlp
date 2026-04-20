{smcl}
{* *! Stata version 18.5 --- 2026-04-20}{...}

{hilite: Data types}{...}
{right:{view "https://github.com/rampezione/stata-guide/raw/main/guides/data-processing/data-processing.sthlp":Data processing}}

{hline}

{pstd}Stata has six data storage types (see {help data_types}), and data can also be missing: {p_end}

{phang2}{c 149} {help missing} (no data),{p_end}
{phang2}{c 149} {stata help data_types:string} (words),{p_end}
{phang2}{c 149} {help byte} (true/false), and{p_end}
{phang2}{c 149} {help int}, {help long}, {stata help data_types:float}, and {help double} for numbers{p_end}

{pstd}Open the sample dataset{p_end}
{phang2}{stata . sysuse auto, clear}


{dlgtab:missing}
 
{pstd}The default . is called the "system missing value" or sysmiss.{p_end}

{pstd}Numeric missing values are represented by large positive values. Thus, the{p_end}
{pstd}expression age > 60 is true if variable age is greater than 60 or missing.{p_end}
{pstd}{bf}Therefore, to exclude missing values, remember to use upper boundary when{p_end}
{pstd}using >. {sf}For example:{p_end}
 
{phang2}{stata . tab rep78, miss}{space 21}{error:// Five missing values}{p_end}
{phang2}{stata . count if rep78>3}{space 20}{error:// The number of obs including missing values is 34}{p_end}
{phang2}{stata . count if rep78>3 & !missing(rep78)}{space 2}{error:// The number of obs excluding missing values is 29}{p_end}
{phang2}{stata . count if rep78>3 & rep78<.}{p_end}
{phang2}{stata . count if rep78>3 & rep78!=.}

 
{dlgtab:string}

{pstd}Strings are stored as str#, for instance, str1, str2, str3, ..., str2045,{p_end}
{pstd}or as strL. The number after the str indicates the maximum length of the{p_end}
{pstd}string. A str5 could hold the word "male", but not the word "female"{p_end}
{pstd}because "female" has six characters. A strL can hold strings of arbitrary{p_end}
{pstd}lengths, up to 2000000000 characters.{p_end}
 
{pstd}Stata keeps data in memory, and you should record your data as parsimoniously{p_end}
{pstd}as possible. If you have a string variable that has maximum length 6, it{p_end}
{pstd}would waste memory to store it as a str20. The storage of variables can be{p_end}
{pstd}optimized using command {cmd:compress}.
 
{phang2}{stata . describe make}{space 23}{error:// Storage type is str18}{p_end}
{phang2}{stata . compress make}{space 23}{error:// Storage type is str17}{p_end}
 
 
{dlgtab:byte}

{pstd}Byte indicates that the variable is stored as an integer between -127 and 100.{p_end}

{phang2}{stata . describe foreign}{space 20}{error:// Storage type is byte}{p_end}
 
 
{dlgtab:int}

{pstd}Int is another storage type which can only hold integers, and it can vary{p_end}
{pstd}between -32,767 and 32,740.{p_end}

{phang2}{stata . describe price mpg rep78}{space 12}{error:// Storage type is "int"}{p_end}
 
 
{dlgtab:long}

{pstd}Long is third and last storage type holding only integers, and it can vary{p_end}
{pstd}between -2,147,483,647 and 2,147,483,620.{p_end}
 
{phang2}{stata . generate long var_long=123456789}{space 4}{error:// Define a long type variable}{p_end}
{phang2}{stata . describe var_long}{space 19}{error:// Stored as "long"}{p_end}
 
 
{dlgtab:float}

{pstd}Float is the default storage type when defining new variable and it's one{p_end}
{pstd}of two types that can hold non-integer numbers (decimals).{p_end}

{pstd}This type of data will be stored with a 7-digit level of accuracy. This{p_end}
{pstd}means that Stata will not round a number stored as a float type, as long{p_end}
{pstd}as the number is 7 total digits or fewer. If precision is needed past{p_end}
{pstd}the 7-digit limit, however, the "double" storage type should be used.{p_end}

{pstd}One potential complication of storing an over 7 digit variable as a "float"{p_end}
{pstd}or smaller is that Stata may round down the integer without advertising{p_end}
{pstd}that it is doing so. We can observe that this occurs by requesting for{p_end}
{pstd}Stata to display an 8-digit integer as "float":{p_end}

{phang2}{stata . display float(16777217)}{space 13}{error:// Result is 16777216}{p_end}

{pstd}Floats have about 7 digits of accuracy; the magnitude of the number does{p_end}
{pstd}not matter. Thus, 1234567 can be stored perfectly as a float, as can{p_end}
{pstd}1234567e+20. The number 123456789, however, would be rounded to 123456792.{p_end}
 
{phang2}{stata . display %11.0f float(123456789)}{p_end}

{pstd}In general, this rounding does not matter. But, if you are storing{p_end}
{pstd}identification numbers, then the rounding could matter. If the ID numbers{p_end}
{pstd}are integers and take 9 digits or less, store them as longs; otherwise,{p_end}
{pstd}store them as doubles. Doubles have 16 digits of accuracy.{p_end}

{pstd}Stata stores numbers in binary, and this has a second effect on numbers{p_end}
{pstd}less than 1. 1/10 has no perfect binary representation just as 1/11 has no{p_end}
{pstd}perfect decimal representation. In float, 0.1 is stored as 0.10000000149011612.{p_end}

{phang2}{stata . display %19.17f float(0.1)}{p_end}

{pstd}Note that there are 7 digits of accuracy, just as with numbers larger than{p_end}
{pstd}1. Stata, however, performs all calculations in double precision. If you{p_end}
{pstd}were to store 0.1 in a float called x1 and then ask the number of{p_end}
{pstd}observations with x1==0.1, the answer would be 0:{p_end}

{phang2}{stata . generate float x1 = 0.1}{p_end}
{phang2}{stata . count if x1==0.1}{space 20}{error:// n = 0}{p_end}
{phang2}{stata . count if x1<0.101}{space 19}{error:// n = 74}{p_end}

{pstd}The 0.1 that you just typed was converted to double, with 16 digits of{p_end}
{pstd}accuracy (0.100000000000000014...), and that number is never equal to 0.1{p_end}
{pstd}stored with float accuracy. Stata is not making a mistake here. This is{p_end}
{pstd}the result of 0.1 not having an exact value in binary (base 2 vs. base 10).{p_end}
{pstd}Since Stata does all calculations in double precision, the rounded value{p_end}
{pstd}of 0.1 is different at float precision than double precision.{p_end}
 
 
{dlgtab:double}

{pstd}As already was said, the accuracy of doubles is 16 digits. And, as we also{p_end}
{pstd}saw, although you have stored your numeric variables as byte, int, long,{p_end}
{pstd}or float, Stata converts all numbers to double before performing any{p_end}
{pstd}calculations.{p_end}

{pstd}The double storage type does not compromise precision as other storage{p_end}
{pstd}types might. So, if we continue the example above by storing 0.1 on x2 as{p_end}
{pstd}a double instead of float, the precision would be 0.1, not 0.100000000000000014:{p_end}

{phang2}{stata . generate double x2 = 0.1}{p_end}
{phang2}{stata . count if x2==0.1}{space 20}{error:// n = 74}{p_end}

{pstd}It is possible to set the  default storage type to double:{p_end}

{phang2}{stata . set type double, permanently}{p_end}

{pstd}Downside of the tradeoff for setting the default storage type to double is{p_end}
{pstd}in increased memory and processing time. If this would be an issue, there{p_end}
{pstd}is a simple way to try reducing the size of the dataset typing{p_end}

{phang2}{stata . compress}{p_end}

{pstd}Stata will check whether there are variables that may need less computer{p_end}
{pstd}space than is provided for in the storage type and will change the storage{p_end}
{pstd}type accordingly. You will be informed about this in the results window.{p_end}


{dlgtab:change storage types}
 
{pstd}The storage type of variables can be changed using recast command. Here,{p_end}
{pstd}numeric variables can be changed to a different numeric type, and string{p_end}
{pstd}variables to a different string type (i.e. different string length).{p_end}

{phang2}{stata . sysuse auto, clear}{p_end}
{phang2}{stata . describe mpg}{p_end}
{phang2}{stata . recast byte mpg}{space 18}{error:// Storage type will be changed from int to byte}{p_end}
{phang2}{stata . describe mpg}{p_end}
 
{pstd}Storage type of a numeric variable can always be changed to a more complex{p_end}
{pstd}type, e.g., from "byte" to "int" or from "long" to "float". It is also{p_end}
{pstd}possible to change a numeric variable to a less complex type (e.g., from{p_end}
{pstd}"float" to "int"){p_end}
 
{pstd}{space 2}- if this causes no loss of precision (for instance, a float variable{p_end}
{pstd}{space 4}the values of which actually contain no decimal values can be changed{p_end}
{pstd}{space 4}to an integer type if the range of values permits, whereas in the{p_end}
{pstd}{space 4}presence of decimal values Stata will refuse to change the storage type){p_end}
{pstd}{space 2}- or if option force is used (here Stata will change the variable type no{p_end}
{pstd}{space 4}matter whether or not this entails a loss of information). For example:{p_end}
   
{phang2}{stata . recast int gear_ratio}{space 12}{error:// Not changed}{p_end}
{phang2}{stata . recast int gear_ratio, force}{space 5}{error:// 74 values changed}{p_end}

{pstd}In the same way, a string variable can always be changed to a longer string{p_end}
{pstd}type. But, a string variable is possible to change a shorter string type{p_end}
{pstd}only if this entails no loss of information or if option force is used.{p_end}

{pstd}The {help tostring}, {help destring}, {help encode}, and {help decode} commands are available for{p_end}
{pstd}chancing numeric to string type or vice versa:{p_end}

{phang2}{c 149} {cmd:destring} is for variables that contain both numeric and nonnumeric{p_end}
{pstd}{space 6}characters (e.g., percentages together with a "%" sign). It will remove{p_end}
{pstd}{space 6}the nonnumeric characters, leaving you with the numeric values only.{p_end}
{phang2}{c 149} {cmd:tostring} will use the numeric values of a variable and will simply make{p_end}
{pstd}{space 6}strings of them. That is, a value of 10 will still look like 10 afterwards,{p_end}
{pstd}{space 6}only it will be a string. Typically, this will not work for "float" or{p_end}
{pstd}{space 6}"double" data.{p_end}
{phang2}{c 149} {cmd:encode} will change a string variable into a variable with numeric values.{p_end}
{pstd}{space 6}Each different string will be replaced by a numeric variable; the previous{p_end}
{pstd}{space 6}(string) values will be attached as labels to the numeric values.{p_end}
{phang2}{c 149} {cmd:decode} will work the other way round. It assumes that a numeric variable{p_end}
{pstd}{space 6}has labels, and it will use the labels to create the new (string) values{p_end}
{pstd}{space 6}of the variable.{p_end}

{pstd}These commands require either a {cmd:replace} (to replace existing variable) or{p_end}
{pstd}a {cmd:generate} (to generate new variable) option.{p_end}

{pstd}Numeric to string{p_end}
{phang2}{stata . generate foreignStr1 = string(foreign)}{p_end}
{phang2}{stata . tostring foreign, generate(foreignStr2)}{p_end}
{phang2}{stata . decode foreign, generate(foreignStr3)}{p_end}
{phang2}{stata . describe foreign foreignStr1 foreignStr2 foreignStr3}{p_end}

{pstd}String to numeric{p_end}
{phang2}{stata . generate foreignNum1 = real(foreignStr1)}{p_end}
{phang2}{stata . destring foreignStr1, gen(foreignNum2)}{p_end}
{phang2}{stata . encode foreignStr1, gen(foreignNum3)}{p_end}
{phang2}{stata . describe foreign foreignNum1 foreignNum2 foreignNum3}{p_end}
 
{hline}

{view "https://github.com/rampezione/stata-guide/raw/main/guides/data-processing/005_explore_data.sthlp": back (Explore data)} / {view "https://github.com/rampezione/stata-guide/raw/main/guides/data-processing/007_summarize.sthlp": next (Summarize data)}
