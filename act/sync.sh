#!/bin/bash

echo 'Synchronization created backups with a remote repository..'
REMOTE_PATH=$REMOTE_ADDR:$REMOTE_BACKUP_DIR
echo $REMOTE_ADDR
if test $REMOTE_ADDR == 'localhost' || $REMOTE_ADDR == '127.0.0.1'
	then
	REMOTE_PATH=$REMOTE_BACKUP_DIR
fi
rsync -aP $APP_DIRECTORY/$TMP_BACKUP_DIR $REMOTE_PATH