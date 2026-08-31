twoway /// 
  (scatter mpg weight if foreign==0, mfcolor("255 215 104") mlcolor("247 141 30")) ///
  (scatter mpg weight if foreign==1, mfcolor(ltblue) mlcolor(navy)) ///
  (lfit mpg weight if foreign==0, lcolor("247 141 30")) ///
  (lfit mpg weight if foreign==1, lcolor(navy)), ///
  legend(pos(12) ring(0) col(2))
