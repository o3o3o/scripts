#!/bin/bash
# collect the ip that be banned, add 

IPTSAVE=./iptables
IPBAN=./banip
TMP=`mktemp`
usage(){
	cat <<EOF
Usage: $0 [OPTIONS]
	-ip   generate ipban to file
	-add	add ipban to fail2ban
EOF
}
function generate_ipban(){
	iptables-save > $IPTSAVE
	cat $IPTSAVE  |grep fail2ban|grep 32 |awk '{ print $4}' | awk -F '/' '{ print $1}' >> $IPBAN
	cat $IPBAN | sort | uniq > $TMP
	cat $TMP > $IPBAN
}

function addbanip(){
	for i in `cat $IPBAN`
	do
		fail2ban-client set ssh-iptables banip $i
	done
}
function main(){
	case "$1" in
		-add)
			addbanip
			;;
		-ip)
			generate_ipban
			cat $IPBAN
			;;
		-h|*)
		usage
	esac
}
main $1
