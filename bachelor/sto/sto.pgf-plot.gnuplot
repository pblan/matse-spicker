set table "sto.pgf-plot.table"; set format "%.5f"
set format "%.7e";;isint(x) = (int(x)==x); log2 = 0.693147180559945; chisq(x,n)=n<=0||!isint(n)?1/0:x<=0?0.0:exp((0.5*n-1.0)*log(x)-0.5*x-lgamma(0.5*n)-n*0.5*log2); set xrange [1.00000e-5:15.0000]; set yrange [0.00000:0.500000]; samples=200; plot chisq(x,8)
