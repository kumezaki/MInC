ls A?.txt | awk 'BEGIN { FS="\."; } { print "sort -n -k1,2 "$1".txt | awk -f awkfile0 -v mod="substr($1,2) }'
ls A??.txt | awk 'BEGIN { FS="\."; } { print "sort -n -k1,2 "$1".txt | awk -f awkfile0 -v mod="substr($1,2) }'
