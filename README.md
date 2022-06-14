# Miyoo Mini - Collection Switcher for Onion-OS
 ----
  Miyoo Mini - Collection Switcher is a Bash scripting which allow to manage collections.
  
  It allows to :
- let you choose your current collection.
- Change the text of the "Favorites" section with the current collection name.
- Change the picture logo of the "Favorites" section with the current collection name.


```
/*  Release Notes (yyyy/mm/dd):                                                             */
/*  V0.1 - 2022/06/14 :                                                                     */
/*    - Initial release                                                                     */
```

 How to install :
 ----
 Copy the content of SD_CARD on the root of your SD card


 How to use :
 ----
 In the main menu of Onion go to Consoles section then select "Collections"
 Choose the Collection that you want to load
 Go back to the main menu, the "Favorites" menu has been renamed with your collection name.
 To add a game in this collection just add it as favorite in the classic way (clic on the Menu button -> add as Favorite
 

 How to add your own collections :
 ----
 At this time it is not possible to create a new collection from the Miyoo Mini directly.
 Creating a new collection is simple: 
 1 - Create a new text file on your SD Card in "Emu\_COLLECTIONS\COLLECTIONS" and rename it : My_new_collection.json
 2 - You're done ;)
 
 It's not a mandatory but you can add some images to have a better result :
 - a preview of your collection with the same name and in the same folder of your json file. 
   e.g if you create "puzzle.json" you can add "puzzle.png" next to this file. (156x278 png)
 - a customized logo for the favorite entry of the main menu, 2 png files located in Themes/{YourTheme}/skin/: 
      ic-favorite-n.png -> normal state logo
      ic-favorite-f.png -> logo with focus
 
 
  Remark : 
 ----
 In this github repository you'll find "HippoStock_favorites logos.pdn" in "_Ressources" directory. 
 It is a Paint.net file which contains some example of icons for the skin HippoStock. Many others remain to be created !
 
 
  How it works ? :
 ----
  I use the classic rom menu to run a script which is charged to overwrite the current favourite list.
  The last collection name loaded is stored in the config.json and allow to backup the current favourite list before loading another one.
  
  Improvements ideas :
 ----
  - I have created 3 collections logos for the skin HippoStock. We could create all the logos for the main games genres (and for all the skins).
  - Looking for a dev which able to create an app to input text with keyboard, "commander" app from Eggs could be a good inspiration.
  - A shortcut (key combo) to change the current collection whereever you are. It would require to create a new shortcut in onion and create an alternative menu for the selection of the collection. ("Theme Switcher" is an open source app from Onion that could help may be).
  - A PC app to manage quickly the collections ?
 
 
 ## Thanks
You like this project ? You want to improve this project ? 

Do not hesitate, **Participate**, there are many ways :
- If you don't know bash language you can test releases , and post some issues, some tips and tricks for daily use.
- If you're a coder you can fork, edit and publish your modifications with Pull Request on github :)<br/>
- Or you can buy me a coffee to keep me awake during night coding sessions :dizzy_face: !<br/><br/>
[![Buy me a coffee][buymeacoffee-shield]][buymeacoffee]
<br/><br/>

[buymeacoffee-shield]: https://www.buymeacoffee.com/assets/img/guidelines/download-assets-sm-2.svg
[buymeacoffee]: https://www.buymeacoffee.com/schmurtz
 ===========================================================================
 