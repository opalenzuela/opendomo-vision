#!/bin/sh
#desc:Add camera
#package:odvision
#type:local

# Copyright(c) 2014 OpenDomo Services SL. Licensed under GPL v3 or later


PIDFILE="/var/opendomo/run/odvision.pid"
CONFIGDIR="/etc/opendomo/vision"

if ! test -z "$2"
then
	FILENAME="$CONFIGDIR/$1.conf"
	echo "NAME=$2" > $FILENAME
	echo "TYPE=$3" >> $FILENAME
fi


if test -f $CONFIGDIR/$1.conf
then
	source $CONFIGDIR/$1.conf
else
	TYPE="dummy"
fi

echo "#> Add camera"
echo "form:`basename $0`"
echo "	code	Code 	text	$ID"
echo "	name	Name	text	$NAME"
echo "	type	Type	list[local,dummy,IP]	$TYPE"
echo 