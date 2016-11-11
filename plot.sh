filename="fb_plot"
plotscript="plot.plt"
list='"facebook" "accuweather" "nytimes" "npr.news"'
for app in $list;
do
	gnuplot -e "filename=$app; outputname='$app.eps'" $plotscript
done
