#!/bin/bash

META=$1

if [ $# -eq 0 ]; then
    META="$(ls *.meta.html)"
fi

TEMPLATE=$(cat template.html | sed -r 's/"style.css"/"style.css?v='$(date +%s)'"/')

replace() {
	while read -r LINE; do
		if ! echo "$LINE"  | grep "<!-- fill content here -->" > /dev/null; then
			echo "$LINE"
		else
			cat "$1" 
		fi
	done < <(echo "$TEMPLATE")
}

for meta in $META; do
	echo "Proccesing $meta"
	html=$(echo $meta | sed 's/meta.//')
	replace $meta > $html
done
