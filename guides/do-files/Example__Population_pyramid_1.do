clear
sysuse pop2000, clear

replace maletotal = -maletotal/1e+6
replace femtotal =  femtotal/1e+6

set scheme gg_hue

twoway ///
    bar maletotal agegrp, horizontal color(navy%80) lcolor(navy) xvarlab(Male) || ///
	  bar femtotal agegrp, horizontal color(maroon%80) lcolor(maroon) xvarlab(Female) || ///
        , ylabel(1(1)17, valuelabel labsize(*.8) angle(0)) ///
        xtitle("Population in millions") ytitle("") ///
        xlabel(-10 "10" -7.5 "7.5" -5 "5" -2.5 "2.5" 2.5 5 7.5 10) ///
        legend(label(1 Male) label(2 Female) pos(1) ring(0) row(2)) ///
        title("Population pyramid") subtitle(". . . subtitle . . .") ///
        note("Source: US Census Bureau, Census 2000", span)
