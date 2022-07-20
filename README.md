# Miyoo Mini - Collection Switcher for Onion-OS
 ----
  Miyoo Mini - Collection Switcher allows to manage collections on [Onion OS](https://github.com/jimgraygit/Onion).
  
  It is essentially based on a Bash script. 
  
 

https://user-images.githubusercontent.com/7110113/173586768-f6a9eba4-3d43-4a87-a095-8534b251ad12.mp4



Since v0.3 :   New navigation between collections :

  ![image by Olywa123](https://user-images.githubusercontent.com/7110113/174198841-65f6fe21-3d90-4c6c-b397-e5514fbd97d0.png)


  
  Collections replace the original favorites menu of the Miyoo Mini with several advantages :
- Choose your current collection.
- Create a new collection directly from your Miyoo Mini
- Delete a collection directly from your Miyoo Mini
- Sort the current collection alphabetically
- Change the text of the "Favorites" section of MainUI with the current collection name.
- Change the picture logo of the "Favorites" section of MainUI section with the current collection name.


```
/*  Release Notes (yyyy/mm/dd):                                                                      */
/*  v0.1 - 2022/06/14 :                                                                              */
/*    - Initial release                                                                              */
/*  v0.2 - 2022/06/16 :                                                                              */
/*    - NEW: Possibility to create a new list directly from the Miyoo Mini                           */
/*    - NEW: Once you select a collection it will go directly in the favorites list                  */
/*      (or in the consoles list of the collection is empty).                                        */
/*    - NEW: Added an option to sort the current collection alphabetically                           */
/*    - FIX: Better management of list with spaces                                                   */
/*  v0.3 - 2022/06/17 :                                                                              */
/*    - NEW: navigation by tree structure directly from the collection menu (Thx Olywa123)           */
/*  v1.0 - 2022/07/20 :                                                                              */
/*    - Added possibility to delete a collection                                                     */
/*    - Added possibility to backup all collections                                                  */
/*    - A lot of new default collections with logos for 2 themes (Default_Onion-DiMo & HippoStock)   */
/*    - A new version of Terminal app with possibility to run command line without                   */
/*       keyboard displayed at start (-q option, thanks Eggs).                                       */
/*    - Fixed lists that do not display completely right after being loaded                          */
```

 How to install :
 ----
 
 - If you want to keep your actual Favorite list, start to backup it : 
   copy SDCARD/Roms/favourite.json on your computer 
 - Click on the "code" button above -> "Download ZIP".
 - Copy the content of SD_CARD folder on the root of your SD card.
 - If you want to add your old favorites list, copy your favourite.json in SDCARD/Emu/_COLLECTIONS/COLLECTIONS/ , rename the file with a name that you like and then add it in favorite (when main main menu is selected).
 
 How to update (and keep all your current favorites lists):
 ----
 - Select the "main" collection before making a backup of your favorites.
 - Backup your current favorite list : copy the folder SD_CARD\Emu\_COLLECTIONS\COLLECTIONS on your computer 
 
   (it contains all the .json files which are your favorites lists)

 - Click on the "code" button above -> "Download ZIP".
 - Copy the content of SD_CARD folder on the root of your SD card (overwrite all the files)
 - Then restore your backup in SD_CARD\Emu\_COLLECTIONS\COLLECTIONS


 How to use :
 ----
 - Once installed go in your favorite and navigate between the different existing collections. Select the one you want to load and press A.
 - Add roms to your collection as usual : select a rom and press menu button -> add as faourite.
 - The navigation works like this :
	 ```
	Collections == Main == Menu
	  |- create new collection
	  |- Delete Collection
	  |- Backup all Collections
	  |- sort the current collection
	  |- Collection 1
		  |- Return to Collections Menu
		  |- sort the current collection
		  |- Game1
		  |- Game2
		  |- ...
	  |- Collection 2
		  |- Return to Collections Menu
		  |- sort the current collection
		  |- Game1
		  |- Game2
		  |- ...
	```

 

 How to add your own collections :
 ----
 
 By default these collections are already created :
```
- 1stlove
- action
- adventure
- beat
- fps
- platform
- puzzle
- race
- rpg
- shoot
- sport
- strategy
```
  
  ----------------------------------------------
 Add your own collection directly from the Miyoo Mini :

 in the main root menu of the collections, run "Create a new collection"
 Then enter a name 11 characters seems to be the maximum to fit in the theme of the Miyoo Mini main menu (you can put more but it will be ugly in the main menu).
 
 ----------------------------------------------
 If you want to create a collection manually from your PC :

 
  - 1 - Select the "==main==" collection before making a backup of your favorites (it could be overwrited otherwise)
  
  - 2 - Make a copy of Emu\_COLLECTIONS\TOOLS\scripts\template.json in "Emu\_COLLECTIONS\COLLECTIONS" and rename it as you like. For example: My_new_collection.json
 
  - 3 - Edit Roms/favourite.json and add My_new_collection.json as the previous one 
			OR
		just run the Miyoo
		load "== main ==" collection 
		go to Consoles -> Collections 
		add "My_new_collection" as favorite 
  
  
 How to add picto on your collections :
 ----
 
 It's not a mandatory but you can add some images to have a more aesthetic result :
 - a preview of your collection with the same name and in the same folder of your json file. 
   e.g if you create "puzzle.json" you can add "puzzle.png" next to this file. (156x278 png)
 - a customized logo for the favorite entry of the main menu: 2 png files located in Themes/{YourTheme}/skin/ : 
     -   ic-favorite-n.png -> normal state logo
      
     -   ic-favorite-f.png -> logo with focus
 
 
  Remark : 
 ----
 In this github repository you'll find "HippoStock_favorites logos.pdn" in "_Ressources" directory. 
 It is a Paint.net file which contains some examples of icons for the skin HippoStock. Many others remain to be created !
 
 
  How it works ? :
 ----
  I use the classic rom menu from MainUI to run a script which is charged to overwrite the current favourite list.
  The last collection name loaded is stored in the config.json and allow to backup the current favourite list before loading another one.
  
  Improvements ideas :
 ----
  - I have created 12 collections logos for the theme "HippoStock" and "Default_Onion-DiMo". We could create all the logos for the [main games genres](https://en.wikipedia.org/wiki/List_of_video_game_genres) (and for all the themes).
  - A shortcut (key combo) to change the current collection whereever you are. It would require to create a new shortcut in onion (by compiling a new keymon) and create an alternative menu for the selection of the collection. ("Theme Switcher" is an open source app from Onion that could help may be).
  - A PC app to manage quickly the collections ?
  - MainUI from Miyoo have a bug : if you add 2 times the same rom it will corrupt your favourite file. As this app is not open source we can't solve that.
 
 
 ## Thanks
You like this project ? You want to improve this project ? 

Do not hesitate, **Participate**, there are many ways :
- If you don't know bash language you can test releases , and post some issues, some tips and tricks for daily use.
- If you're a coder or a graphist you can fork, edit and publish your modifications with Pull Request on github :)<br/>
- Or you can buy me a coffee to keep me awake during night coding sessions :dizzy_face: !<br/><br/>
[![Buy me a coffee][buymeacoffee-shield]][buymeacoffee]
<br/><br/>

[buymeacoffee-shield]: https://www.buymeacoffee.com/assets/img/guidelines/download-assets-sm-2.svg
[buymeacoffee]: https://www.buymeacoffee.com/schmurtz
 ===========================================================================
 
