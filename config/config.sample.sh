KEEP_DAYS=5

# Mongo backup settings
MONGO_DBNAMES=('')
MONGO_DUMP_FILENAME='#NAME#-'`date +%H-%M-%S`'-mongo.tgz'
MONGO_DUMP_ZIP=1
MONGO_PORT='27017'
MONGO_USER=''
MONGO_PASS=''
MONGO_AUTH_DB=''

# MySQL backup settings
MYSQL_DBNAMES=()
MYSQL_DUMP_FILENAME='#NAME#-'`date +%H-%M-%S`'-mysql.tgz'
MYSQL_DUMP_ZIP=1
MYSQL_USER=''
MYSQL_PASS=''

# Folders backup settings
FOLDERS=()
FOLDER_BASE='/'
FOLDER_DUMP_FILENAME='#NAME#-'`date +%H-%M-%S`'-folder.tar'
FOLDER_DUMP_ZIP=0

REMOTE_BACKUP_DIR='/tmp/backup/'
REMOTE_ADDR='localhost'

TMP_BACKUP_DIR='./tmp/'`date +%Y-%m-%d`