#!/bin/sh

SelectedCollection=$( (cd /mnt/SDCARD/Emu/_COLLECTIONS/COLLECTIONS && ls) | grep ".json" | awk '!/^-/ && !/==/' | /mnt/SDCARD/Emu/_COLLECTIONS/TOOLS/scripts/shellect.sh -t "Delete Collection Menu" -b "Select your item and press start button")
 
 
 Mychoice=$( echo -e "No\nYes" | /mnt/SDCARD/Emu/_COLLECTIONS/TOOLS/scripts/shellect.sh -t "Are you sure to delete \"${SelectedCollection}\" ?" -b "Press start to validate your choice.\n(A backup of your collections will be done.)")
 
 if [ "$Mychoice" = "Yes" ]; then
	  sed -i "/\"DeletedCollection\":/c \"DeletedCollection\":\"${SelectedCollection}\""  "/mnt/SDCARD/Emu/_COLLECTIONS/config.json"
	  echo -e "${SelectedCollection} has been deleted\n"
 else
	  sed -i "/\"DeletedCollection\":/c \"DeletedCollection\":\"\""  "/mnt/SDCARD/Emu/_COLLECTIONS/config.json"
	  echo -e "Nothing has been deleted\n"
 fi
  
  
  

 read -p "Press start to exit" SelectedCollection
	
 
