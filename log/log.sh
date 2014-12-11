#!/bin/bash

#For recording dead lock log  before 'core restart|stop now'  in asterisk

LOG_FILE=/tmp/media_lock.log

record_log()
{
    ls -R /home/jq >> $LOG_FILE
}

check_size()
{
    size=$(du -m $LOG_FILE | awk '{print $1}')
    #if $LOG_FILE is larger than 256M, rm it
    if(($size>256)); then
        echo "rm $LOG_FILE...."
        rm $LOG_FILE
    fi
}
while ((1))
do
    check_size
    record_log
done
