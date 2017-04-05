#!/bin/bash

ssh cuda 'rm -rf /var/www/ndbc2017/*'
cat ndbc2017.tgz | ssh cuda 'tar xzf - -C /var/www/ndbc2017'
