# APCSFinalProject-WaterBoyFireGirl

**Team Shark Boy and Lava Girl** <br />
**Team Members:** Elizabeth Paperno and Katherine Zhao <br />

**Breif Description:** Our project aims to replicate the ever-so iconic computer game, FireBoy and WaterGirl. This two-player game has a simple premise. For every level, get to the doors, while moving through the maze-like structure, avoiding all of the obstacles, and collecting gems. The challenge is having the two players work together in order to defeat the obstacles, which can contain anything from toxic lava to sliding levers.

**Design Document**: https://docs.google.com/document/d/1iK45Qwn9qvfcaNxFyKv3e3qwPiR3SknMaFlGl36e-hc/edit?usp=sharing

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

## Running Instructions
