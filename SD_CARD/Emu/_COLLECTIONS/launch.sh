#!/bin/sh
echo -ne "\n\n"
 
echo ========================================== Start of collections swicther script ==========================================

#echo $0 $*
#$0     ${homedir}/launch.sh  						->  /mnt/SDCARD/Emu/_COLLECTIONS/launch.sh
#$1     ${homedir}/./COLLECTIONS/race.collection	->  /mnt/SDCARD/Emu/_COLLECTIONS/./COLLECTIONS/test.json




homedir=`dirname "$0"`				#  /mnt/SDCARD/Emu/_COLLECTIONS
CollecName=`basename "$1"`			#  mycollection.json
CollecShortName="${CollecName%.*}"  #  we remove the extension to get the name of the collection -> mycollection




if [ "$CollecShortName" = "-Create New Collection" ]; then

	echo ========================   !!! New collection !!!    ========================
	echo "    We run Terminal app with a script in parameter to have a kind of input text box"
	"/mnt/SDCARD/App/Terminal/st" -e "$homedir/TOOLS/scripts/CreateNewCollection.sh"
	
	echo "    Get the new collection name stored in config.json"
	CollecShortName=$(grep '"CreatedCollection":*' $homedir/config.json |sed 's|.*"CreatedCollection":"\([^"]*\)".*|\1|')
	if [ "$CollecShortName" = "" ]; then 
		echo "No name inputed, we exit"
		exit 0
	fi
	CollecName="${CollecShortName}.json"
	
	echo "    We create the new collection file : \"${CollecName}\""
	# We add shortcuts towards the main menu and to the sort alphabetically script to the new collection created.
	echo "{\"label\":\"  Return to Main Menu\",\"launch\":\"/mnt/SDCARD/Emu/_COLLECTIONS/launch.sh\",\"type\":5,\"rompath\":\"/mnt/SDCARD/Emu/_COLLECTIONS/COLLECTIONS/== Main ==.json\"}">"${homedir}/COLLECTIONS/$CollecName"
	echo "{\"label\":\"  Sort current collection alphabetically\",\"launch\":\"/mnt/SDCARD/Emu/_COLLECTIONS/launch.sh\",\"type\":5,\"rompath\":\"/mnt/SDCARD/Emu/_COLLECTIONS/COLLECTIONS/-Sort current collection alphabetically.json\"}">>"${homedir}/COLLECTIONS/$CollecName"
	# We add a shortcut towards the new collection in the main menu.
	echo "{\"label\":\"${CollecShortName}\",\"launch\":\"/mnt/SDCARD/Emu/_COLLECTIONS/launch.sh\",\"type\":5,\"rompath\":\"/mnt/SDCARD/Emu/_COLLECTIONS/COLLECTIONS/${CollecName}\"}">>"/mnt/SDCARD/Roms/favourite.json"
	
	
	# if you don't want the shortcut to main menu, just create an empty file :
	#touch "${homedir}/COLLECTIONS/$CollecName"
	
	echo "    We delete the database to refresh the list of collections"
	rm "${homedir}/COLLECTIONS/COLLECTIONS_cache2.db"

fi


if [ "$CollecShortName" = "-Sort current collection alphabetically" ]; then

	echo ========================   !!! New collection !!!    ========================
	echo "    We sort the current collection alphabetically."
	sort -o /mnt/SDCARD/Roms/favourite.json /mnt/SDCARD/Roms/favourite.json
	exit 0

fi

echo "    homedir : $homedir"
echo "    CollecName : $CollecName"
echo "    CollecShortName : $CollecShortName"

echo "    Get the last used collection name stored in config.json"
LastCollection=$(grep '"LastCollection":*' $homedir/config.json |sed 's|.*"LastCollection":"\([^"]*\)".*|\1|')
echo ======================== Previous collection : $LastCollection  ========================


echo "    We backup the previous favorite list : \"${LastCollection}\""
cp  /mnt/SDCARD/Roms/favourite.json "${homedir}/COLLECTIONS/$LastCollection.json"

echo "    We overwrite the new name of the last collection in config.json : \"${CollecShortName}\""
sed -i "/\"LastCollection\":/c \"LastCollection\":\"${CollecShortName}\","  "$homedir/config.json"


echo "    Let's overwrite the current favorite list with \"${CollecName}\" !"
cp "${homedir}/COLLECTIONS/$CollecName" /mnt/SDCARD/Roms/favourite.json

echo "    We get the current language file." 

CurrentLang=$(grep '"language":*' /appconfigs/system.json |sed 's/"\|,//g' | awk '{print $2}')
# (grep select the line, sed remove quotes and comma, awk take the second part of the result) e.g  result : -> en.lang 

echo ======================== Current language file : $CurrentLang    ========================
echo "    We change the name of the favorite section in the Miyoo Mini / Onion UI"
sed -i "/\"1\":/c \"1\": \"${CollecShortName}\"," "/mnt/SDCARD/miyoo/app/lang/$CurrentLang"




# in addition of the renaming of the favorite section you can also change the logo of the favorite section
# each of us has different Onion skin but uncomment this below if you want to activate it.

echo "    We get the current theme from system.json."
# e.g from system.json ->  "theme":        "/mnt/SDCARD/Themes/HippoStock/",

CurrentTheme=$(grep '"theme":*' /appconfigs/system.json |sed 's/"\|,//g' | awk '{print $2}')
# (grep select the line, sed remove quotes and comma, awk take the second part of the result)


echo ======================== Current Theme : $CurrentTheme          ========================


# Then we could change the favorite logo of the skin, 2 png files : 
# 	ic-favorite-n.png -> normal state logo
# 	ic-favorite-f.png -> logo with focus

# I have imagined 3 different places where the logos could be stored, uncomment only one of these 3 sections to enable this functionality.
# The first solution is the best because it can adapt to each theme


# 1 - The preview logo is stored in the skin folder (so we could ask to skins creators to manage these icons natively)

#  -----------------------------------------------------------------------

# "ic-favorite-n_main.png" and "ic-favorite-f_main.png" 
# are the default main menu logo, let's create it if it doesn't exist
if ! [ -f "${CurrentTheme}skin/ic-favorite-n_main.png" ]; then 
	echo "    Main logo does not exist, let's create \"${CurrentTheme}skin/ic-favorite-n_main.png\""
	cp "${CurrentTheme}skin/ic-favorite-n.png" "${CurrentTheme}skin/ic-favorite-n_main.png"
fi

if ! [ -f "${CurrentTheme}skin/ic-favorite-f_main.png" ]; then 
	echo "    Main logo with focus does not exist, let's create \"${CurrentTheme}skin/ic-favorite-f_main.png\""
	cp "${CurrentTheme}skin/ic-favorite-f.png" "${CurrentTheme}skin/ic-favorite-f_main.png"
fi

#  -----------------------------------------------------------------------

# If a special logo for this collection has been created in the skin directory, we use it !
if [ -f "${CurrentTheme}skin/ic-favorite-n_${CollecShortName}.png" ]; then
	MainMenuLogo=${CollecShortName}
	echo "    Customized logo found for \"${MainMenuLogo}\"."
else
	# if the logo has not been created we take the main logo
	MainMenuLogo="main"
	echo "    No customized logo found, using default main logo."
fi

#  -----------------------------------------------------------------------

# we affect the current logo to the main menu
echo "    Overwriting logos for the favorite menu in the current theme."
cp "${CurrentTheme}skin/ic-favorite-n_${MainMenuLogo}.png"   "${CurrentTheme}skin/ic-favorite-n.png"
cp "${CurrentTheme}skin/ic-favorite-f_${MainMenuLogo}.png"   "${CurrentTheme}skin/ic-favorite-f.png"



# ==========================================================================================

# 2 - The preview logo is stored at the same place than the favorite list
#cp ${homedir}/COLLECTIONS/ic-favorite-n.png   "${CurrentTheme}skin/ic-favorite-n.png"
#cp ${homedir}/COLLECTIONS/ic-favorite-f.png   "${CurrentTheme}skin/ic-favorite-f.png"

# ==========================================================================================

# 3 - The preview logo is the logo replacement itself...
#cp ${homedir}/COLLECTIONS/Imgs/${CollecShortName}.png   "${CurrentTheme}skin/ic-favorite-n.png"
#cp ${homedir}/COLLECTIONS/Imgs/${CollecShortName}_focus.png   "${CurrentTheme}skin/ic-favorite-f.png"

# ==========================================================================================

myfilesize=$(wc -c "/mnt/SDCARD/Roms/favourite.json" | awk '{print $1}')
echo "    Current file size of the collection : $myfilesize bytes."
# With the shortcuts to the main menu and the sort script, the default size of a new collection is 372 bytes.
# Change this number if you modify the defaults shortcuts above.

if [ "$myfilesize" = "372" ]; then
	echo "    Collection is empty, go to Consoles menu , First console selected"
	cp "$homedir/TOOLS/Menu_Navigation/Consoles_list.json" /tmp/state.json
else
	echo "    We navigate to the Favourites Menu to see the current of our current collection"
	cp "$homedir/TOOLS/Menu_Navigation/Favorites_list.json" /tmp/state.json
fi



# Main menu , collection logo selected
#cp $homedir/TOOLS/Menu_Navigation/Favorites_selected.json /tmp/state.json



echo -ne "========================================== End of collections swicther script ==========================================\n\n\n"














