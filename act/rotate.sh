#!/bin/bash

echo 'Rotation backup directories..'
dsh -cM -m $REMOTE_ADDR "find $REMOTE_BACKUP_DIR* -type d -mtime +$KEEP_DAYS -exec rm -rf ./* {} \;"