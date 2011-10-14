#!/bin/bash

cd ~/Docs/Music/Mobile_In_C/minc_unfuddle/ForZero/ForZero_MaxMSP/
pwd

DONE=0
FILE_NAME=./fz_download.txt

# this is for debugging only
#cp ../MaxMSP/download_test.txt ./fz_download.txt
#cp ./download_exit.txt ./fz_download.txt

while [ $DONE = 0 ]; do
	if [ -e $FILE_NAME ]; then
		awk -f fz_download_awk0.txt $FILE_NAME
		if [ $? = 1 ]; then
			echo exiting fz_download_script0.sh
			DONE=1
		fi
		echo $FILE_NAME created!
		rm $FILE_NAME
	else
# this is for debugging only
		echo $FILE_NAME not found
	fi
	if [ $DONE = 0 ]; then
		sleep 0.5
	fi
done

exit
