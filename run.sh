ABSOLUTE_FILENAME=`readlink -e "$0"`
APP_DIRECTORY=`dirname "$ABSOLUTE_FILENAME"`

APP_CONFIGS=$(ls $APP_DIRECTORY/config)
while getopts "c:" opt;
do
case $opt in
c)	echo "Loading config: $OPTARG.sh"
	APP_CONFIGS=("${OPTARG}.sh")
	if ! test -e "${APP_DIRECTORY}/config/${OPTARG}.sh"
		then
		echo "${APP_DIRECTORY}/config/${OPTARG}.sh doesn't exists"
		APP_CONFIGS=()
	fi
	;;
esac	
done

for config in $APP_CONFIGS; do
	source $APP_DIRECTORY'/config/'$config
	BACKUP_WAS_MAKED=0
	
	if ! test -d $APP_DIRECTORY/$BACKUP_DIR
		then
		mkdir $APP_DIRECTORY/$BACKUP_DIR
	fi

	if test $MONGO_DBNAMES
		then
		source $APP_DIRECTORY'/inc/mongo.inc.sh'
		BACKUP_WAS_MAKED=1
	fi

	if test $MYSQL_DBNAMES
		then
		source $APP_DIRECTORY'/inc/mysql.inc.sh'
		BACKUP_WAS_MAKED=1
	fi

	if test $FOLDERS
		then
		source $APP_DIRECTORY'/inc/folder.inc.sh'
		BACKUP_WAS_MAKED=1
	fi

	if test $BACKUP_WAS_MAKED -eq 1
		then
		source $APP_DIRECTORY'/inc/sync.inc.sh'
	fi
done