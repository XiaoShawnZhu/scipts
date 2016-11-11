set term post eps color solid 30 enh
set output outputname
set xrange [-10:1010]
#set yrange [0:60000]
set ylabel "launch time (ms)"font "Times-Roman,40"
set xlabel "extra delay (ms)"font "Times-Roman,40"
set xtics font "Times-Roman,30"
set ytics font "Times-Roman,30"
set grid
#set output "fb.eps"
plot filename using (200*$0):1 title filename w lines lt 7 lw 5, filename using (200*$0):1:2:3 title "error" w yerrorbars lt 10 lw 10
#plot "npr.txt" w lp pt 7
#plot "weather.txt" w lp pt 7
#plot "tinder.txt" w lp pt 7
#plot "groupon.txt" w lp pt 7
#plot "tumblr.txt" w lp pt 7
