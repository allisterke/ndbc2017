
# paste table in Word
# save Word as html
# parse table from html

cat agenda.htm |
    iconv -f gbk |
    tr -d '[\r\n]' |
    grep -P -o '<table.*?</table>' |
    sed -r 's/<\/?span[^>]*>//g' |
    sed -r 's/<\/?o:p>//g' |
    sed -r 's/<\/?p[^>]*>//g' |
    sed -r 's/<\/?b[^>]*>//g' |
    sed -r "s/style='[^']*?'//g" |
    sed -r 's/ class=[[:alpha:][:digit:]-]*//g' |
    sed -r 's/ lang=[[:alpha:][:digit:]-]*//g' |
    sed -r 's/ width=[[:alpha:][:digit:]-]*//g' |
    sed -r 's/[?？]//g' | less

(
echo '<table border=1 cellspacing=0 cellpadding=0 >'
cat group-discuss.htm |
    iconv -f gbk |
    tr -d '[\r\n]' |
    grep -P -o '<table.*?</table>' |
    sed -r 's/<\/?span[^>]*>//g' |
    sed -r 's/<\/?a[^>]*>//g' |
    sed -r 's/<\/?table[^>]*>//g' |
    sed -r 's/<\/?o:p>//g' |
    sed -r 's/<\/?p[^>]*>//g' |
    sed -r 's/<\/?b[^>]*>//g' |
    sed -r "s/style='[^']*?'//g" |
    sed -r 's/ class=[[:alpha:][:digit:]-]*//g' |
    sed -r 's/ lang=[[:alpha:][:digit:]-]*//g' |
    sed -r 's/ width=[[:alpha:][:digit:]-]*//g' |
    sed -r 's/ valign=[[:alpha:][:digit:]-]*//g' |
    sed -r 's/<td colspan=3 *>([^<]*)<\/td>/<td colspan=3 class="group">\1<\/td>/g'
echo '</table>'
) | less

cat accommodation.htm |
    iconv -f gbk |
    tr -d '[\r\n]' |
    grep -P -o '<table.*?</table>' |
    sed -r 's/<\/?span[^>]*>//g' |
    sed -r 's/<\/?o:p>//g' |
    sed -r 's/<\/?p[^>]*>//g' |
    sed -r 's/<\/?b[^>]*>//g' |
    sed -r "s/style='[^']*?'//g" |
    sed -r 's/ class=[[:alpha:][:digit:]-]*//g' |
    sed -r 's/ lang=[[:alpha:][:digit:]-]*//g' |
    sed -r 's/ width=[[:alpha:][:digit:]-]*//g' |
    sed -r 's/ valign=[[:alpha:][:digit:]-]*//g' |
    less
