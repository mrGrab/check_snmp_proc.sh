#!/bin/bash

# Plugin return codes
STATE_OK=0
STATE_CRITICAL=2
STATE_WARNING=1
STATE_UNKNOWN=3

# Version
VERSION="1.1"

# Commands
CMD_BASENAME="/usr/bin/basename"
CMD_SNMPWALK="/usr/bin/snmpwalk"
CMD_GREP="/bin/grep"
CMD_WC="/usr/bin/wc"

# Script name
SCRIPTNAME=`$CMD_BASENAME $0`


#Default variables
OID=.1.3.6.1.2.1.25.4.2.1.2
HOST="127.0.0.1"
COMM="public"
PROCN="snmpd"
STATE=$STATE_UNKNOWN
WARNING=0
CRITICAL=0


print_usage() {
  echo "Usage: ./check_snmp_proc -H 127.0.0.1 -C public -N ssh -w 3 -c 0"
  echo "  $SCRIPTNAME -H ADDRESS"
  echo "  $SCRIPTNAME -C STRING"
  echo "  $SCRIPTNAME -N STRING"
  echo "  $SCRIPTNAME -w INTEGER"
  echo "  $SCRIPTNAME -c INTEGER"
  echo "  $SCRIPTNAME -h"
  echo "  $SCRIPTNAME -V"
}

print_version() {
  echo $SCRIPTNAME version $VERSION
  echo ""
  echo "This nagios plugins comes with ABSOLUTELY NO WARRANTY."
}

print_help() {
  print_version
  echo ""
  print_usage
  echo ""
  echo "Check the process by name via snmp"
  echo ""
  echo "-H ADDRESS"
  echo "   Name or IP address of host (default 127.0.0.1)"
  echo "-C STRING"
  echo "   Community name for the host SNMP agent (default public)"
  echo "-N PROCESS NAME"
  echo "   Exact process name (default snmpd)"
  echo "-w INTEGER"
  echo "   Warning level of running processes (default: 0)"
  echo "-c INTEGER"
  echo "   Critical level of running processes (default: 0)"
  echo "-h"
  echo "   Print this help screen"
  echo "-V"
  echo "   Print version and license information"
  echo ""
  echo "This plugin uses the 'snmpwalk' command included with the NET-SNMP package."
}

while getopts H:C:N:w:c:Vh OPT
do
  case $OPT in
    H) HOST="$OPTARG" ;;
    C) COMM="$OPTARG" ;;
    N) PROCN="$OPTARG" ;;
    w) WARNING=$OPTARG ;;
    c) CRITICAL=$OPTARG ;;
    h)
      print_help
      exit $STATE_UNKNOWN
      ;;
    V)
      print_version
      exit $STATE_UNKNOWN
      ;;
   esac
done

#Plugin 
PROCN=${PROCN:0:15}
CNT=`$CMD_SNMPWALK -v1 -On -c $COMM $HOST $OID | $CMD_GREP "\"$PROCN\"" | $CMD_WC -l`
if [ $CNT -eq 0 ]; then
        STATE=$STATE_CRITICAL
	DESCRIPTION="CRITICAL: Process $PROCN does not exist"
elif [ $CNT -le $WARNING ]; then
	STATE=$STATE_WARNING
	DESCRIPTION="WARNING: Running only $CNT instances of $PROCN"
elif [ $CNT -le $CRITICAL ]; then
        STATE=$STATE_CRITICAL
	DESCRIPTION="CRITICAL: Running only $CNT instances of $PROCN"
else
	STATE=$STATE_OK
	DESCRIPTION="OK: Process exist. Running instances: $CNT"
	fi
echo $DESCRIPTION
exit $STATE
