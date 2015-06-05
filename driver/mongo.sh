#!/bin/bash

if test $MONGO_DBNAMES
	then
	for DBNAME in ${MONGO_DBNAMES[@]}; do
		echo "Creating backup of the mongo database '${DBNAME}'.."
		MONGO_COMMAND="mongodump --db $DBNAME --out ./ --port $MONGO_PORT"
		if test $MONGO_USER
			then
			MONGO_COMMAND=`echo $MONGO_COMMAND`" --username $MONGO_USER"
		fi 
		if test $MONGO_PASS
			then
			MONGO_COMMAND=`echo $MONGO_COMMAND`" --password $MONGO_PASS"
		fi 
		if test $MONGO_AUTH_DB
			then
			MONGO_COMMAND=`echo $MONGO_COMMAND`" --authenticationDatabase $MONGO_AUTH_DB"
		fi 
		eval $MONGO_COMMAND

		zip $DBNAME `echo $MONGO_DUMP_FILENAME | sed s/#NAME#/$DBNAME/g` $MONGO_DUMP_ZIP
		
		rm -r $DBNAME
	done
fi