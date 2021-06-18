#!/bin/bash

file=`date +%Y-%m-%d.log`
cur=`date "+%H:%M:%S %s"`

case "$1" in
    "start") s="Start"
	     ;;
    "stop") s="Stop"
	    ;;
    *)	echo "Bad Status"
	;;
esac

if [[ "$s" != "" ]]
then
    s="${s} when $cur"
    echo $s
    echo $s >> $file

    git add $file
    git commit -m "new record"
    git push
fi
