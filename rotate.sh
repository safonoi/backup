ABSOLUTE_FILENAME=`readlink -e "$0"`
APP_DIRECTORY=`dirname "$ABSOLUTE_FILENAME"`

for config in $(ls $APP_DIRECTORY/config); do
	source $APP_DIRECTORY'/config/'$config
	if [ -d $REMOTE_BACKUP_DIR ] 
		then
			find $REMOTE_BACKUP_DIR* -type d -mtime +$KEEP_DAYS -exec rm -rf {} \;
		else
			echo 'There is no ' $REMOTE_BACKUP_DIR ' directory!'
	fi
done
