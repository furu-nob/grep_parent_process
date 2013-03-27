#!/bin/sh

function usage {
  echo "****************"
  echo "$0 usage"
  echo "****************"
  echo ""
  echo "\$ $0 PARENTS_PID"
  echo ""
}


if [ -e $1 ]
then
  usage
  exit 0
fi

PARENTS_PID=$1
echo -n "$PARENTS_PID "


while [ -n "$PARENTS_PID"  ]
do
  for CHILD_PID in $PARENTS_PID
  do
    PARENTS_PID=`ps --no-headers --ppid=$CHILD_PID | awk '{print $1}'`
    if [ -n "$PARENTS_PID" ]
    then
      for OUT_PID in $PARENTS_PID
      do
        echo -n "$OUT_PID "
      done
    fi
  done
done

