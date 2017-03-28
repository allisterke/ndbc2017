#!/bin/bash

META="$(ls *.meta.html)"
#META=index.meta.html

replace() {
	while read -r LINE; do
		if ! echo "$LINE"  | grep "<!-- fill content here -->" > /dev/null; then
			echo "$LINE"
		else
			cat "$1" 
		fi
	done < template.html
}

for meta in $META; do
	echo "Proccesing $meta"
	html=$(echo $meta | sed 's/meta.//')
	replace $meta > $html
done
