clear
sysuse pop2000, clear

replace maletotal = -maletotal/1e+6
replace femtotal =  femtotal/1e+6

* Graph using the base scheme (gg_hue)
set scheme gg_hue

twoway ///
   bar maletotal agegrp, horizontal xvarlab(Male)   || ///
   bar femtotal  agegrp, horizontal xvarlab(Female) || ///
   , ylabel(1(1)17, valuelabel labsize(*.8) angle(0)) ///
     xtitle("Population in millions") ytitle("") ///
     xlabel(-10 "10" -7.5 "7.5" -5 "5" -2.5 "2.5" 2.5 5 7.5 10) ///
     legend(label(1 Male) label(2 Female) pos(1) ring(0) row(2)) ///
     title("Base scheme (gg_hue)") ///
     subtitle("No additional styling") ///
     note("Source: US Census Bureau, Census 2000", span) ///
     name(g_base, replace)

* Graph using gg_hue and grstyle refinements
set scheme gg_hue
grstyle init
grstyle set plain, horizontal grid
grstyle set color navy
grstyle set color gs12: tick
grstyle set linewidth 0.2
grstyle set linewidth .2pt: tick
grstyle set legend 1
grstyle set color gs15: legend region
grstyle set linewidth 1.4pt: legend region outline
grstyle set symbol O T

twoway ///
   bar maletotal agegrp, horizontal xvarlab(Male)   || ///
   bar femtotal  agegrp, horizontal xvarlab(Female) || ///
   , ylabel(1(1)17, valuelabel labsize(*.8) angle(0)) ///
     xtitle("Population in millions") ytitle("") ///
     xlabel(-10 "10" -7.5 "7.5" -5 "5" -2.5 "2.5" 2.5 5 7.5 10) ///
     legend(label(1 Male) label(2 Female) pos(1) ring(0) row(2)) ///
     title("gg_hue + grstyle") ///
     subtitle("Refined grid and axis ticks") ///
     note("Source: US Census Bureau, Census 2000", span) ///
     name(g_grstyle, replace)

* Combine graphs side by side for comparison
graph combine g_base g_grstyle, ///
    col(2) ///
    title("Effect of grstyle refinements on a base scheme")
