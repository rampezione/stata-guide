twoway pcspike wage68 ttl_exp68 wage88 ttl_exp88               ///
   || scatter wage68 ttl_exp68, msym(O)                        ///
   || scatter wage88 ttl_exp88, msym(O) pstyle(p4)             ///
   mlabel(occ) xscale(range(17))                               ///
   title("Change in US women's experience and earnings")       ///
   subtitle("by occupation, 1968 to 1988")                     ///
   ytitle(Earnings) xtitle(Total experience)                   ///
   note("Source: National Longitudinal Survey of Young Women") ///
   legend(order(2 "1968" 3 "1988"))
