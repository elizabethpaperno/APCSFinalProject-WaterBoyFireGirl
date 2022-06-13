# APCSFinalProject-WaterBoyFireGirl

**Team Shark Boy and Lava Girl** <br />
**Team Members:** Elizabeth Paperno and Katherine Zhao <br />

**Brief Description:** Our project aims to replicate the ever-so iconic computer game, FireBoy and WaterGirl. This two-player game has a simple premise. For every level, get to the doors, while moving through the maze-like structure, avoiding all of the obstacles, and collecting gems. The challenge is having the two players work together in order to defeat the obstacles, which can contain anything from toxic lava to sliding levers.

**Design Document**: https://docs.google.com/document/d/1iK45Qwn9qvfcaNxFyKv3e3qwPiR3SknMaFlGl36e-hc/edit?usp=sharing <br />
**Demo Slides**: https://docs.google.com/presentation/d/1174Y5IPQZfgdaJ9O2YijLSqUBdh7O-0QrLetgJ9Attw/edit?usp=sharing

## Development Log
5/23:
* Elizabeth:
  * Created the Maze class and completed the methods outlined in the UML
  * Not yet tested due to issues testing with a file --> continuous FileNotFound exception, eventhough it was present in the directory
  * Next step is to build the Level class
* Katherine:
  * Created the Character class, changed some of the instance variablees/methods based on what would be most help
  * Trying to full understand the most straightforward way to do jump down, up, or simply jump
  * Next Step is to get all the movement methods working

 5/24
 * Elizabeth:
   * Use processing method loadFromFIle instead of Scanner to read in the base board from the file --> solve the issue from yesterday
   * Complete Maze class, merge back to main, solve merge conflicts in Game
   * Decide to build Item class instead of Level class, as Item is necessary for Level
   * Create new branch titled "P1-Elizabeth" to work on Item
   * Write skeleton for Item class based on UML --> fill in all method except adding the item to level
 * Katherine:
   * Starting to understand how pvectors can help with moving.
   * collision detecting to see when to stop the avatar from moving.
   * will make a method running through every block surrounding character to see how it shouold move.

 5/25
 * Elizabeth:
   * Creation of class Item
   * Setup the skeleton, and accessor methods
   * Figure out how the Item class with work within Level to create a board with obstacles --> conceptual
   * Begin working on level
 * Katherine:
   * Wrote out an overall movement method that consistently applies gravity as long as the area around a character is not in contact with a block
   * PVectors for speed and position, easily accessible and returnable to other classes
   * Starting to set up the actual game class itself, and methods that will run continously.

 5/26
 * Elizabeth:
   * Continue working on Level
   * Begin writing method to read in and initalize items from a file and add them to the ArrayList
   * Attempt to figure out how to store all Items in one place but still maintain access to all their methods that are not part of the subclass --> still unclear (Interface??)
   * Try to figure out how to structure file in a way that I can link a Lever to a Platform --> figured out
 * Katherine:
   * Started working on the main game class so we have a way to test all of the code out.

5/27:
* Elizabeth:
   * Continue working on Level
   * figure out way to store and access methods of subclasses of Item --> ArrayLists of all subclasses
   * add/remove necessary methods from item and maze

5/29:
* Elizabeth:
   * Manually write file for base platform using a grid overlay on an image of Level1
   * Write display for base board platforms on maze --> working
   * Write subclasses of Item --> no issues found thus far --> still need to add interactions with Character
   * Make necessary changes btwn my and Katherine's work to make it compatable (small fixes in file names, etc)
   *  Write file lsiiting items and position (also using the overlay)
   * Begin reading in file for Items + figuring out how to display them --> not working (continue tommorow)
* Katherine:
   * There are issues with collision detection, and whether or not its in the rght areas
   * Move horizontallyy works, jumping does not
   * Everything is displayed correctly, characters now need to interact with them.

5/30:
* Katherine:
   * Finally figured out jump, still some glitches and bugs.
   * Interacts with gems and lava (mostly)successfully- still some issues for range.
   * Edited the board to better suit the abilities of the characters.
 * Elizabeth:
   * get file read in for Items completely working + check for them to be properly displayed
   * add comments for Katherine about the interactions CHaracter should have with the Items (proper order of method calls)
   * try to get door working --> not working --> find alternate solution to end level for Demo
   * fix small bugs in code

 5/31
 * Elizabeth:
   * Work on getting door working
   * modifiy position and size of door to better suit for testing
   * rewrite conditional in check()
   * continous issue with FireBoy not being able to open door? --> confusing because it works for WaterGirl
   * Weird color flashing for Door with WaterGirl --> unsure how to fix

  6/1
  * Elizabeth:
    * Get door working
    * create new screen for level completed
    * create pfont to centralize text
    * future plan --> work on creating transition page between levels + some array list of levels to inde through them for the future
 * Katherine:
   * Modified file read in for lava- ability to jump over
   * Collision testing still won't fully work

  6/2
  * Elizabeth:
    * Very sick and dying
  * Katherine:
    * Collision works on top and bottom, does not work with sides because of conditionals
    * also very sick and dying

  6/3
  * Elizabeth:
    * Very sick and dying
  * Katherine:
    * Also very sick and dying

  6/4
  * Elizabeth:
    * Very sick and dying
  * Katherine:
    * Also very sick and dying

  6/5
  * Elizabeth:
    * Add button and transition screen between Levels
    * Move code for characters into Level instead of in game
    * Fix small bug in door
  * Katherine:
    * Deciding what action happens when collision with sides occur, bounce back, or let the character slide down
    * Include boundary checking for the edges of the screen

6/6
* Elizabeth:
  * Fix another bug in door where the color (after it was changed) no longer matched up to the color of character --> compare to the original color of    door instead of the current color.
  * Begin work on the lever class.
* Katherine:
  * Display for items like lever, platform and button
  * Started read-in for the arraylists in every character frame
6/7
* Elizabeth:
  * Complete methods for class platform, lever, and button (with the exception of the display methods katherine's writing).
  * Begin working on Pause screen
* Katherine:
  * More experimenting with collision!
  * I think that the jump mag and gravity mag also have a hand to do with the detection

6/8
* Elizabeth:
  * continue working on a pause screen for the Game
  * Plan: press key 'p' for pause screen then press 'r' for retry and 'p' again for unpause --> had issue's with using "p" for both --> decided to use enter to unpause
  * With retry character are not moving back to original positions --> decide to fix using retry function

6/9
* Elizabeth:
  * Finish reset() function in character
  * Call reset function from level when the screen is on
  * realize that we have to give characters access to the new level once it's read in --> fix null pointer exception
 * Katherine
  * Finally managed to figure collisions! can interact with the maze successfully!
  * Displays for the items on both the pixel screen, and maze board
  * It doesn't directly correate to the actions on the actual game, but gravity is much stronger in this version

6/10
* Elizabeth:
  * Figure out how the file read in for button and lever will work --> Essentially pass in lever/button in one line and initialize both and add to    
    ArrayLists
  * Add positions of additional obstacles to item file
* Katherine:
  * Linking Items to levels so that they could have more immersive interactions
  * Created a game over screen when one of the characters touches lava
  * Added to the file read in for Level that would look through more of the elements on the items document

6/11
* Elizabeth:
  * Begin working on writing the files and finding a level we can replicate
  * Forgot to branch. So sorry :(
  * Write file for Level2
  * Write file for items in level 2
  * Begin working on intro screen for game --> all thats left is design
* Katherine:
  * Finalized Display
  * Character interactions with each item requires immense amount of linking different Levels and obejcts
  * Had to add constructors that would directly link to levels and platforms they are changing
  * Moving the platforms and blocks is causing much of an issue- especially when it comes to treating the platform and block likke part of the maze as to avoid collision testing


6/12
* Elizabeth:
  * Write file for Level2
  * Write file for items in level 3
  * design intro screen
  * redesign, game over and pause screen, acounting for interactions (by clicking, etc.)
  * fix bugs between screens
  * Add pImages to represent gems
  * Add PImages to represent character
  * add colors to lever, platform, and button
* Katherine:
  * Added some touches to the constructors, booleans for access
  * Block will work only occasionally
  * But platform and lever does- we did not go with unpulling lever because that just wont fly
  * Edited the levels so they're actually playable
  * changed how lever is displayed once pulled
## Running Instructions
#### Press Play on Game.pde to run!
There are two characters, Fireboy and Watergirl.<br />
Fireboy can walk in lava but cannot walk in water or green goo.<br />
Watergirl can walk in water but cannot walk in lava or green goo. <br />
Use the arrows to control Fireboy and A, W, S, D to control WaterGirl.<br />
Press p for pause. <br />
The goal is to for every character to reach the door of their corresponding character.
