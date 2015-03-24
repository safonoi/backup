#!/bin/bash

for DBNAME in ${MYSQL_DBNAMES[@]}; do
	echo "Creating backup of the mysql database '${DBNAME}'.."
	DUMP_NAME_TMP=$DBNAME'.sql';
	mysqldump -u$MYSQL_USER -p$MYSQL_PASS $DBNAME > $APP_DIRECTORY/$BACKUP_DIR/$DUMP_NAME_TMP;
  tar -czf $APP_DIRECTORY/$BACKUP_DIR'/'`echo $MYSQL_DUMP_FILENAME | sed s/#NAME#/$DBNAME/g` $APP_DIRECTORY/$BACKUP_DIR/$DUMP_NAME_TMP
	rm -r $APP_DIRECTORY/$BACKUP_DIR/$DUMP_NAME_TMP
done