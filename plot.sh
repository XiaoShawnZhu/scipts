fileName="throughput_tcp"
gnuplot -e "tmpName='{$fileName}.eps'" $plotScript
#inkscape --export-pdf=${fileName}.pdf --export-area-drawing {$fileName}.eps
