#!/bin/bash

helpInfo() {
  echo "-help option"
}

notProgramMessage() {
  echo "The Program does not exist or is not configured in the script."
}

if [[ $# -gt 2 ]]; then
  echo The Script needs only two parameter.
else
  if [ -n $1 ]; then
    if [ -n $2 ]; then
      if [ -d $2 ] || [ -f $2 ]; then
        case "$1" in
          -help) helpInfo ;;
	  netbeans) ~/netbeans-12.6/netbeans/bin/netbeans $2 & ;;
    	  *) notProgramMessage ;;
        esac
      else
	echo "The directory or file does not exist: $2"
      fi
    else
      case "$1" in
        -help) helpInfo ;;
        netbeans) ~/netbeans-12.6/netbeans/bin/netbeans & ;;
        *) notProgramMessage ;;
      esac
    fi
  else
    echo "No parameters found."
  fi
fi
