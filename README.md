# Code Break Lockdown: An Educational CS Game

Code Break Lockdown is a beginner-friendly, educational computer science game that is designed to enhance learning and engagement for students at Cleveland State University (CSU). Developed using Godot's open-source game engine, the game employs an escape room format in which the player is locked in a prison inspired by cyberpunk settings and aesthetics. The player must traverse all the rooms using hints to solve computer science-themed puzzles to progress and escape. The game features a scene manager with a passcode-based system for level progression and global randomization to encourage concept learning over memorization. The game’s puzzles focus on using CIS concepts such as variables, if-else statements, bitwise operations, binary conversion, and loops to beat levels. Emphasizing intuitive gameplay, visual appeal, and educational effectiveness, Code Break Lockdown aims to serve as an interactive learning resource to complement traditional Computer Science Information (CIS) courses.

This game was developed by a group of undergraduate computer science students as a final senior design project. 
[Presentation Slides](https://github.com/sidneyzweifel/Senior-Design-Game-Files/blob/main/Senior%20Design%20Documents/Final%20Senior%20Design%20Presentation.pdf)

## Background
### Educational Video Games & Learning
* Goal to simulate traditional learning methods and develop self-directed problem-solving skills
* Founded on a cycle of learning
* Allows players to accumulate knowledge, get feedback, and apply that knowledge to novel situations 
* Streamline the learning experience by providing a multi-sensory environment curated toward practicing a specific topic or skills

### Science, Technology, Art, Engineering & Mathematics Project
* This project blends visual art with computer science to provide a comprehensive gaming experience
* This aligns with CSU’s pursuit of offering integrated STEM degrees
* Aims to inspire students to build on to our project and create their own projects

## System Design
### Specifications
* Created in [Godot](https://godotengine.org/download/windows/) with GDScript 
* All assets are open-source or original creations made by contributors
### Scene Manager
* Controls player progression using a passcode system, advancing with the correct passcode and resetting the level otherwise
* Uses a door asset with exported paths to manage scene transitions; key functions include *handle_door()*, *go_to_passcode()*, and *return_to_puzzle()*
* The main limitation is the lack of saved player data between scenes, which resets the player's position
### Global Randomization
* Ensures replayability by randomizing game features, focusing on concept learning over memorization
* The *set_passcode()* function in **global.gd** generates random five-digit codes using Godot's random number generation function
* The *get_passcode()* function verifies user inputs against the randomized passcode to control level advancement

![alt text](https://github.com/sidneyzweifel/Senior-Design-Game-Files/blob/main/Images/manager_screenshot.png)

### Game Structure
* Four levels that explore novice-level computer science concepts
* Concept difficulty increases as levels progress (Easiest - Level 1, Hardest - Level 4) 
* Each features an aspect of randomization to encourage replay value

### Level 1: Variables
* Introduces the topic of variables and how to print them to display their value
* The player searches through a mock file system and prints variables to find the passcode to unlock the door 
* Encourages replayability by ensuring the passcode's value and location are different every time
  
  ![alt text](https://github.com/sidneyzweifel/Senior-Design-Game-Files/blob/main/Images/puzz1_screenshot1.png)
  ![alt text](https://github.com/sidneyzweifel/Senior-Design-Game-Files/blob/main/Images/puzz1_screenshot2.png)

### Level 2: If-Else Statements
* Covers the basics of if-else statement implementation
* Puzzles include finding the output of conditional statements to find the passcode
* Statements will be generated with different values and conditions for replayability
* [Level 2 Documentation](https://github.com/sidneyzweifel/Senior-Design-Game-Files/blob/main/Senior%20Design%20Documents/Level%20Two%20(Puzzle2_TEST.tscn)%20Documentation%20-%20Sheet1.pdf)
  
![alt text](https://github.com/sidneyzweifel/Senior-Design-Game-Files/blob/main/Images/puzz2_screenshot1.png)
![alt text](https://github.com/sidneyzweifel/Senior-Design-Game-Files/blob/main/Images/puzz2_screenshot2.png)

### Level 3: Binary Conversion and Bitwise Logic
* Focuses on binary and bitwise logic in computer science                        
* The player uses hints around the room and their knowledge of bitwise operations and binary conversions two different puzzles
* A door passcode to advance to the next level is obtained after solving all puzzles
* [Level 3 Documentation](https://github.com/sidneyzweifel/Senior-Design-Game-Files/blob/main/Senior%20Design%20Documents/Level%20Three%20(Puzzle3_TEST.tscn)%20Documentation%20-%20Sheet1.pdf)
  
![alt text](https://github.com/sidneyzweifel/Senior-Design-Game-Files/blob/main/Images/puzz3_screenshot1.png)
![alt text](https://github.com/sidneyzweifel/Senior-Design-Game-Files/blob/main/Images/puzz3_screenshot2.png)

### Level 4: Loops
* The level allows the player to practice setting the starting index, the conditional statement, and update rules of a for-loop
* The player must learn how all the different components of a for-loop work together by setting the remaining non-randomized components 
* Includes a demo that shows players how for-loops work step by step and some hints to guide them
  
![alt text](https://github.com/sidneyzweifel/Senior-Design-Game-Files/blob/main/Images/puzz4_screenshot1.png)
![alt text](https://github.com/sidneyzweifel/Senior-Design-Game-Files/blob/main/Images/puzz4_screenshot2.png)

## Future Work
* Revamping the programming for the game so that components developed early in development are built more gracefully
* Creating more levels that cover more advanced computer science topics
    * Intermediate Concepts: arrays, objects, inheritance, simple data structures
    * Advanced Concepts: algorithms, polymorphism, binary search trees, complex data structures

 ## References
[References Doc](https://github.com/sidneyzweifel/Senior-Design-Game-Files/blob/main/Senior%20Design%20Documents/References%20-%20Code%20Break%20Lockdown.pdf)
