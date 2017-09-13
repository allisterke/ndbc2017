
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
    sed -r 's/<\/?table[^>]*>//g' |
    sed -r 's/<\/?o:p>//g' |
    sed -r 's/<\/?p[^>]*>//g' |
    sed -r 's/<\/?b[^>]*>//g' |
    sed -r "s/style='[^']*?'//g" |
    sed -r 's/ class=[[:alpha:][:digit:]-]*//g' |
    sed -r 's/ lang=[[:alpha:][:digit:]-]*//g' |
    sed -r 's/ width=[[:alpha:][:digit:]-]*//g' |
    sed -r 's/ valign=[[:alpha:][:digit:]-]*//g' |
    cat -n |
    sed -r 's/^ *10 */<tr><td colspan=3 style="padding:20px; font-weight: bold; background-color: lightgrey;"><a id="demo">系统演示：<\/a><\/td><\/tr>/' |
    sed -r 's/^ *([[:digit:]]) */<tr><td colspan=3 style="padding:20px; font-weight: bold; background-color: lightgrey;">分组讨论\1：<\/td><\/tr>/'
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
