#!/bin/bash
#
#if the file size is greater than 300M, we backup and clear log
#by michael, 2014-12-11

DATE=$(date '+%F')
TAR_LOG_DIR=/tmp
LOG_FILE=*.log

LOG_PATH=/tmp

tarlog()
{
    cd $LOG_PATH

    for f in $(ls $LOG_FILE)
    do
        bak=$(basename $f .log)-$DATE.gz
        size=`du -m $f |awk '{print $1}'`
        if [ $size -gt 300 ]
        then
            tar czf  $TAR_LOG_DIR/$bak $f
            echo "" > $f
        fi
    done

}
tarlog
