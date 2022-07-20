#!/bin/sh
homedir=`dirname "$0"`				#  /mnt/SDCARD/App/Terminal

echo -ne "\n\n"
echo  "========================================="
echo  " Write a collection name and press start"
echo  " (About 10 characters maximum)"
echo  " (Let empty to cancel)"
echo  "========================================="

# We read the inputed text
read -p "name : " NewCollecShortName

# We modify the config.json from collection manager with the "CreatedCollection"
sed -i "/\"CreatedCollection\":/c \"CreatedCollection\":\"${NewCollecShortName}\","  "$homedir/../../config.json"


