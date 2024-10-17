# Dragon Ball Omega Rogue

<p align="center">
  <img src="./assets/title/dbrogue.png" alt="Dragon Ball Omega Rogue Banner" />
</p>

A small game in Ruby inspired by **Dragon Ball** and developed with **Gosu**.

Basically, it's a turn-based rogue-like, and there’s not much more to say.
You have a fight every time, and between each fight, you get new bonuses. That's the idea in a nutshell.

This game was created to explore and test various design patterns in object-oriented programming.

## Gameplay Overview

### Game Concepts
- **Character Creation**
    - You can create your own character by choosing the body and the head for the **sayan**, this feature is currently not disponible for the **chilled** race. 
- **Character Training**: 
    - You can train your character with a system of point.
- **Combat Mechanics**: 
    - It's turn based fight.
- **New Bonuses**: 
    - At the end of every fight you can choose between 3 rewards

## Installation

1. Clone the repo:
   ```bash
   git clone https://github.com/EthanCarollo/dragon-ball-omega-rogue.git
   cd dragon-ball-omega-rogue
   ```
   
2. Install **Gosu**:
   ```bash
   gem install gosu
   ```

3. Run the game:
   ```bash
   ruby main.rb
   ```
