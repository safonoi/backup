#!/bin/bash

if test $FOLDERS
	then
	for FOLDER in ${FOLDERS[@]}; do
		echo "Creating folder '${FOLDER}' backup.."
		FOLDER_ESCAPED=$(echo $FOLDER | sed -e 's/\([\.\/]\)/|/g')
		zip $FOLDER_BASE/$FOLDER `echo $FOLDER_DUMP_FILENAME | sed s/#NAME#/$FOLDER_ESCAPED/g` $FOLDER_DUMP_ZIP
	done
fi