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
echo $PARENTS_PID


while [ -n "$PARENTS_PID"  ]
do
  for CHILD_PID in $PARENTS_PID
  do
    PARENTS_PID=`ps axl | awk '{print $3,$4}'|grep "$CHILD_PID\$" |cut -d' ' -f1 `
    if [ -n "$PARENTS_PID" ]
    then
      for OUT_PID in $PARENTS_PID
      do
        echo $OUT_PID
      done
    fi
  done
done

