ABSOLUTE_FILENAME=`readlink -e "$0"`
APP_DIRECTORY=`dirname "$ABSOLUTE_FILENAME"`

APP_CONFIGS=$(ls $APP_DIRECTORY/config)

# If the user specified a particular configuration
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

# Include zip function
source $APP_DIRECTORY/act/zip.sh

# for each declared config
for config in $APP_CONFIGS; do
	source $APP_DIRECTORY'/config/'$config
	BACKUP_WAS_MAKED=0
	
	if ! test -d $APP_DIRECTORY/$TMP_BACKUP_DIR
		then
		mkdir $APP_DIRECTORY/$TMP_BACKUP_DIR
	fi

	cd $APP_DIRECTORY/$TMP_BACKUP_DIR/
	# Include each backup-driver and execute it
	for driver in $(ls $APP_DIRECTORY/driver/); do
		source $APP_DIRECTORY'/act/pre_driver.sh'
		source $APP_DIRECTORY/driver/$driver
		source $APP_DIRECTORY'/act/post_driver.sh'
	done

	# Sync backups if necessary
	if ! test `ls . | wc -l` -eq 0 
		then
		source $APP_DIRECTORY'/act/sync.sh'
	fi

	cd -
	# Clear temp backup dir
	rm -rf $APP_DIRECTORY/$TMP_BACKUP_DIR/
done