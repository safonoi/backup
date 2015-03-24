KEEP_DAYS=5
BACKUP_DIR='./tmp/'`date +%Y-%m-%d`

# Mongo backup settings
MONGO_DBNAMES=()
MONGO_DUMP_FILENAME='#NAME#.'`date +%H-%M-%S`'.mongo.gz'
MONGO_PORT='27017'
MONGO_USER=''
MONGO_PASS=''
MONGO_AUTH_DB=''

# MySQL backup settings
MYSQL_DBNAMES=()
MYSQL_DUMP_FILENAME='#NAME#.'`date +%H-%M-%S`'.mysql.gz'
MYSQL_USER=''
MYSQL_PASS=''

# Folders backup settings
FOLDERS=()
FOLDER_DUMP_FILENAME='#NAME#.'`date +%H-%M-%S`'.folder.gz'

REMOTE_BACKUP_DIR='/test/test'
REMOTE_ADDR='test@test'