. twoway ///
    line close date, yaxis(1) lcolor(#3d34a3) ///
    || bar change date, yaxis(2) color("255 215 104") lcolor("247 141 30") ///
    || in 1/60, ///
    ysca(axis(1) r(1000 1400)) ylab(1200(50)1400, axis(1)) ///
    ysca(axis(2) r(-50 300)) ylab(-50 0 50, axis(2)) ///
    ytick(-50(25)50, axis(2) grid) ///
    legend(off) xtitle("Date") title("S&P 500") ///
    yline(1150, axis(1) lstyle(foreground)) ///
    subtitle("January to March 2001") ///
    note("Source: Yahoo!Finance and Commodity Systems, Inc.")
