#!/bin/bash
updates=$(checkupdates | wc -l)
if [ $updates -eq "0" ]
then
  echo "󰅠 "
elif [ $updates > "0" ]
then
  echo "󰅧  ${updates}"
else
  checkUpdate
fi

checkUpdate () {
  updates=$(checkupdates | wc -l)
  if [ $updates -eq "0" ]
  then
    echo "󰅠 "
  elif [ $updates > "0" ]
  then
    echo "󰅧  $updates"
  else
    echo "󰧠 "
  fi
}
