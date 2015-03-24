#!/bin/bash

for DBNAME in ${MONGO_DBNAMES[@]}; do
	echo "Creating backup of the mongo database '${DBNAME}'.."
  MONGO_COMMAND="mongodump --db $DBNAME --out $APP_DIRECTORY/$BACKUP_DIR --port $MONGO_PORT"
  if [ $MONGO_USER ]
  	then
  	MONGO_COMMAND=`echo $MONGO_COMMAND`" --username $MONGO_USER"
  fi 
  if [ $MONGO_PASS ]
  	then
  	MONGO_COMMAND=`echo $MONGO_COMMAND`" --password $MONGO_PASS"
  fi 
  if [ $MONGO_AUTH_DB ]
  	then
  	MONGO_COMMAND=`echo $MONGO_COMMAND`" --authenticationDatabase $MONGO_AUTH_DB"
  fi 
  eval $MONGO_COMMAND
  tar -czf $APP_DIRECTORY/$BACKUP_DIR'/'`echo $MONGO_DUMP_FILENAME | sed s/#NAME#/$DBNAME/g` $APP_DIRECTORY/$BACKUP_DIR/$DBNAME
	rm -r $APP_DIRECTORY/$BACKUP_DIR/$DBNAME
done