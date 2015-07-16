#!/bin/bash

if test $MYSQL_DBNAMES
	then
	for DBNAME in ${MYSQL_DBNAMES[@]}; do
		echo "Creating backup of the mysql database '${DBNAME}'.."
		DUMP_NAME_TMP=$DBNAME'.sql'
		mysqldump -u$MYSQL_USER -p$MYSQL_PASS $DBNAME --skip-lock-tables --force > $DUMP_NAME_TMP || true
		
		zip $DUMP_NAME_TMP `echo $MYSQL_DUMP_FILENAME | sed s/#NAME#/$DBNAME/g` $MYSQL_DUMP_ZIP

		rm -r $DUMP_NAME_TMP
	done
fi