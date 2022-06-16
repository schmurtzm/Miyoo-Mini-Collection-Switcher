# Miyoo Mini - Collection Switcher for Onion-OS
 ----
  Miyoo Mini - Collection Switcher is a Bash scripting which allow to manage collections on [Onion OS](https://github.com/jimgraygit/Onion).
  
  
  

https://user-images.githubusercontent.com/7110113/173586768-f6a9eba4-3d43-4a87-a095-8534b251ad12.mp4


  
  Collections replace the original favorites menu of the Miyoo Mini with several advantages :
- Choose your current collection.
- Create a new collection
- Sort the current collection alphabetically
- Change the text of the "Favorites" section with the current collection name.
- Change the picture logo of the "Favorites" section with the current collection name.


```
/*  Release Notes (yyyy/mm/dd):                                                             */
/*  v0.1 - 2022/06/14 :                                                                     */
/*    - Initial release                                                                     */
/*  v0.2 - 2022/06/16 :                                                                     */
/*    - NEW: Possibility to create a new list directly from the Miyoo Mini                  */
/*    - NEW: Once you select a collection it will go directly in the favorites list         */
/*      (or in the console list of the collection is empty).                                */
/*    - NEW: Added an option to sort the current collection alphabetically                  */
/*    - FIX: Better management of list with spaces                                          */
```

 How to install :
 ----
 
 Click on the "code" button above -> "Download ZIP".
 
 Copy the content of SD_CARD folder on the root of your SD card
 
 How to update (and keep all your current favorites lists):
 ----
-  Select the "main" collection before making a backup of your favorites.
 - Backup your current favorite list : copy the folder SD_CARD\Emu\_COLLECTIONS\COLLECTIONS on your computer 
   
   (it contains all the .json files which are your favorites lists)

 - Click on the "code" button above -> "Download ZIP".
 - Copy the content of SD_CARD folder on the root of your SD card (overwrite all the files)
 - Then restore your backup in SD_CARD\Emu\_COLLECTIONS\COLLECTIONS


 How to use :
 ----
 - In the main menu of Onion go to Consoles section then select "Collections"
 - Choose the Collection that you want to load
 - Go back to the main menu, the "Favorites" menu has been renamed with your collection name.
 - To add a game in this collection just add it as favorite in the classic way (click on the Menu button -> add as Favorite)
 

 How to add your own collections :
 ----
 At this time it is not possible to create a new collection from the Miyoo Mini directly.
 
 But on your PC, creating a new collection is simple: 
 
  - 1 - Create a new text file on your SD Card in "Emu\_COLLECTIONS\COLLECTIONS" and rename it as you like. For example: My_new_collection.json
 
  - 2 - You're done ;)
 
 It's not a mandatory but you can add some images to have a better result :
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
  I use the classic rom menu to run a script which is charged to overwrite the current favourite list.
  The last collection name loaded is stored in the config.json and allow to backup the current favourite list before loading another one.
  
  Improvements ideas :
 ----
  - I have created 3 collections logos for the skin HippoStock. We could create all the logos for the [main games genres](https://en.wikipedia.org/wiki/List_of_video_game_genres) (and for all the skins).
  - Looking for a dev which able to create an app to input text with keyboard, "commander" app from Eggs could be a good inspiration.
  - A shortcut (key combo) to change the current collection whereever you are. It would require to create a new shortcut in onion and create an alternative menu for the selection of the collection. ("Theme Switcher" is an open source app from Onion that could help may be).
  - A PC app to manage quickly the collections ?
 
 
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
 
