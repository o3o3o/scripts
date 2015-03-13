#!/bin/bash
#by michael
# you need to add this file to cron
#EXAMPLE: every 1 minitue to execute
# m h dom mon dow user  command
#*/1 * *    *   * {PATH}/monitor.sh

#SYSLOG=local0				# Which syslog facility to use (disabled if blank)
export LD_LIBRARY_PATH=/usr/local/lib:/usr/lib:$LD_LIBRARY_PATH

NAME=monit
BIN_PREFIX=/usr/local/sbin

LOG_PREIFX=/tmp
LOG_RUN=$LOG_PREIFX/${NAME}modules_runing.log
LOG_MODULE=$LOG_PREIFX/${NAME}.log

# you should add you programm into the MOUDLES
MODULES="prg1 prg2"  #modules we will be start

message(){
	DATE=$(date '+%F %T ') 
	if test "x$SYSLOG" != "x" ; then
	    logger -p "${SYSLOG}.warn" -t $NAME[$$] "$1"
	fi
	if test "x$LOG_RUN" != "x" ; then
	    echo "$DATE: $1" >> "$LOG_RUN"
	fi
	#echo "$DATE: $1" >&2
}
monitor_modules(){
        for prg in $MODULES
        do
            prg=$BIN_PREFIX/$prg
            if [ -x $prg ] ;then
                old_prg=$(pgrep -f "$prg") ##XXX: module name must be not belongto each other: mqtt-uc mqtt-uc2
                if [ -z "$old_prg" ]; then
                    LOG=$LOG_PREIFX/`basename $prg`.log
                    ($prg &>> $LOG&) && message "^^^^^^^-->$prg is died, restarted"
#($prg &>> /dev/null&) && message "^^^^^^^-->$prg is died, restarted"
                fi
            else
                message "XXXXXXX--> Cannot found $prg!"
            fi
        done
}

main(){
    if [ ! -d `dirname $LOG_RUN` ]; then
        mkdir `dirname $LOG_RUN` ||  echo "Cannot find directory `dirname $LOG_RUN`"
    else
        monitor_modules
    fi
}

main
