#!/bin/bash

if [ -z $1 ]; then
	echo 'please specify which server to deploy'
	exit 1
fi

bash pack.sh
#ssh cuda 'rm -rf /var/www/ndbc2017/*'
cat ndbc2017.tgz | ssh $1 'tar xzf - -C /var/www/ndbc2017'
