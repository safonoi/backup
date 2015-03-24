#!/bin/bash

for FOLDER in ${FOLDERS[@]}; do
	echo "Creating folder '${FOLDER}' backup.."
	FOLDER_ESCAPED=$(echo $FOLDER | sed -e 's/\([\.\/]\)/|/g')
	tar -czf $APP_DIRECTORY/$BACKUP_DIR'/'`echo $FOLDER_DUMP_FILENAME | sed s/#NAME#/$FOLDER_ESCAPED/g` $FOLDER
done