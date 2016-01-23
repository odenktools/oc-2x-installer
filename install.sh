#!/bin/bash

echo "What do you want to do?"
echo "   1) First Install, fix permission"
echo "   2) Re-CHMOD opencart directory"
echo "   3) Install config files"
echo "   4) Re-init after upload extensions"

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

read -p "Select an option [1-4]: " option

case $option in
1)
	read -p "folder admin name : " adminpath
	
	if [ ! -f $SCRIPTPATH/config.php ] ; then
		echo '' >> $SCRIPTPATH/config.php
	fi

	if [ ! -f $SCRIPTPATH/$adminpath/config.php ] ; then
		echo '' >> $SCRIPTPATH/$adminpath/config.php
	fi
	
	chmod 777 $SCRIPTPATH/config.php
	chmod 777 $SCRIPTPATH/$adminpath/config.php
	chmod 777 $SCRIPTPATH/image/
	chmod 777 $SCRIPTPATH/image/cache/
	chmod 777 $SCRIPTPATH/image/catalog/
	chmod 777 $SCRIPTPATH/system/storage/cache/
	chmod 777 $SCRIPTPATH/system/storage/logs/
	chmod 777 $SCRIPTPATH/system/storage/download/
	chmod 777 $SCRIPTPATH/system/storage/upload/
	chmod 777 $SCRIPTPATH/system/storage/modification/
	
	exit;;
2)
	chmod 777 $SCRIPTPATH/image/
	chmod 777 $SCRIPTPATH/image/cache/
	chmod 777 $SCRIPTPATH/image/catalog/
	chmod 777 $SCRIPTPATH/system/storage/cache/
	chmod 777 $SCRIPTPATH/system/storage/logs/
	chmod 777 $SCRIPTPATH/system/storage/download/
	chmod 777 $SCRIPTPATH/system/storage/upload/
	chmod 777 $SCRIPTPATH/system/storage/modification/
	

	echo "Done..."
	exit;;
3)
	read -p "folder admin name : " adminpath
	
	if [ ! -f $SCRIPTPATH/config.php ] ; then
		echo '' >> $SCRIPTPATH/config.php
	fi

	if [ ! -f $SCRIPTPATH/$adminpath/config.php ] ; then
		echo '' >> $SCRIPTPATH/$adminpath/config.php
	fi
	
	chmod 777 $SCRIPTPATH/config.php
	chmod 777 $SCRIPTPATH/$adminpath/config.php
	echo "Done..."
	exit;;
	
4)
	read -p "folder admin name : " adminpath
	
	sudo find $SCRIPTPATH -type f -print0 | xargs -0 chmod 0664
	sudo find $SCRIPTPATH -type d -print0 | xargs -0 chmod 0775
	
	chmod 777 $SCRIPTPATH/image/
	chmod 777 $SCRIPTPATH/image/cache/
	chmod 777 $SCRIPTPATH/image/catalog/
	chmod 777 $SCRIPTPATH/system/storage/cache/
	chmod 777 $SCRIPTPATH/system/storage/logs/
	chmod 777 $SCRIPTPATH/system/storage/download/
	chmod 777 $SCRIPTPATH/system/storage/upload/
	chmod 777 $SCRIPTPATH/system/storage/modification/
	
	if [ -d $SCRIPTPATH/vqmod/ ] ; then
		chmod 777 $SCRIPTPATH/vqmod/
		chmod -R 777 $SCRIPTPATH/vqmod/vqcache/
		if [ -f $SCRIPTPATH/vqmod/mods.cache ] ; then
			chmod 777 $SCRIPTPATH/vqmod/mods.cache
		fi
	fi

	chmod 777 $SCRIPTPATH/config.php
	chmod 777 $SCRIPTPATH/$adminpath/config.php
	chmod 777 $SCRIPTPATH/index.php
	chmod 777 $SCRIPTPATH/$adminpath/index.php	
	chmod +x install.sh
	echo "Done..."
	exit;;
	
esac