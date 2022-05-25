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
   * will make a method running through every block surrounding character to see how it shouold movee. 

## Running Instructions
