* Dropped-line plot with labeled points.

sysuse lifeexp, clear
keep if region==3
generate lngnp = ln(gnppc)
quietly regress lexp lngnp
predict r, resid

twoway dropline r gnppc, ///
    yline(0, lstyle(foreground)) ///
    ylab(-6(1)6) mlabel(country) mlabpos(9) ///
    subtitle("Regression of life expectancy on ln(gnp)", pos(11)) ///
    note("Residuals in years; positive values indicate" ///
         "longer than predicted life expectancy")
