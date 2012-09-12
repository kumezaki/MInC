#!/bin/bash

PARENT_DIR=$(dirname $0)
#echo $PARENT_DIR
cd $PARENT_DIR
#pwd

FILE_NAME=./fz_download.txt

# this is for debugging only
#cp ../MaxMSP/download_test.txt ./fz_download.txt
#cp ./download_exit.txt ./fz_download.txt

if [ -e $FILE_NAME ]; then
	awk -f fz_download_awk0.txt $FILE_NAME
	if [ $? = 1 ]; then
		echo exiting download script
	fi
	echo $FILE_NAME created!
	rm $FILE_NAME
else
# this is for debugging only
	echo $FILE_NAME not found
fi

exit
