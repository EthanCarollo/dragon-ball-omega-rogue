---
title: "The design patterns used"
description: The different design pattern used in the game
---

## What is a design pattern

A design pattern is a reusable solution to a common problem in software design. It provides a structured approach to solving issues that arise during development, promoting code maintainability and flexibility.

So in our case, in this project, we had to includes a lot of them.

### Singleton Pattern

In our case, the Singleton pattern is primarly used when we need to load data, so in that way, we ensure that the data is only loaded once and accessible everywhere

This is the code for the CharacterData Singleton for example.

```ruby
class CharacterData
    @instance = nil

    def self.instance
        @instance ||= new
    end

    attr_reader :data

    def initialize
        load_json
    end

    def refill_health_for_all_player
        @characters.each { |character| character.heal(99999999999999) }
    end

    def get_character(id)
        @characters.find { |character| character.id == id }
    end

    private def load_json
        file = File.read('./data/character.json')
        json_data = JSON.parse(file)
        @characters = json_data['data'].map do |char_data|
            char = CharacterDirector.create_character_from_json(char_data)
            DebugLog.info "SUCCESS : Successfully create character : #{char.id}"
            char
        end
    rescue Errno::ENOENT
        DebugLog.error "Le fichier JSON n'a pas été trouvé."
        @data = {}
    rescue JSON::ParserError => e
        DebugLog.error "Erreur de syntaxe dans le fichier JSON : #{e.message}"
        @data = {}
    end
end
```

### Factory Pattern 

In our case, the Factory Pattern is primary used for the UI, to create some button easily

```ruby
class ButtonFactory
  def initialize(window)
    @window = window
  end

  def create_button(x:, y:, width:, height:, text:, background_color:, hover_color:, text_color:, &callback)
    Button.new(@window, x, y, width, height, text, background_color, hover_color, text_color, &callback)
  end

  def create_training_button(x:, y:, width:, height:, training_name:, training_cost:, &callback)
    background_color = Gosu::Color::WHITE
    hover_color = Gosu::Color::GRAY
    text_color = Gosu::Color::BLACK

    TrainingButton.new(
      @window,
      x,
      y,
      width,
      height,
      training_name,
      training_cost,
      background_color,
      hover_color,
      text_color,
      &callback
    )
  end
  ...
end
```

With some modifications, this Factory can be very powerfull !

### Builder Pattern

As you also can see in the Factory, the Character uses the Builder Pattern to get build, in that way we can create really simply some character.

```ruby
class CharacterDirector
    def self.create_character_from_json(char_data)
        char_hp = 0
        begin
            if char_data['hp'] == nil
                raise "error"
            end
            char_hp = char_data['hp']
        rescue
            DebugLog.error("ERROR : Cannot get hp of the character : #{char_data['name']} ")
            char_hp = 100
        end

        if char_data['type'] == "normal"  
            character = NormalCharacter.new(char_data['name'], char_hp)
                                    .add_head(Part.new(char_data['full_body']))
                                    .add_body(Part.new(char_data['full_body']))
                                    .add_stats(CharacterStats.new(char_data['stats']['strength'], 
                                                                    char_data['stats']['intelligence'], 
                                                                    char_data['stats']['wisdom'],
                                                                    char_data['stats']['armor']))
        else 
            DebugLog.warning "ERROR : #{char_data['type']} isn't a valid type in character_factory.rb"
            return
        end

        char_data['attack'].each do |attack_data|
            attack_type = attack_data['type']
            if attack_type == 'strength'
                character.add_attack(StrengthAttack.new(attack_data['name'], 
                                                        attack_data['min'], 
                                                        attack_data['max']))
            elsif attack_type == 'intelligence'
                character.add_attack(IntelligenceAttack.new(attack_data['name'], 
                                                            attack_data['min'], 
                                                            attack_data['max']))
            else
                    DebugLog.warning "WARNING : attack type of #{attack_data["type"]} doesn't exist in character_factory.rb"
            end
        end
    
        character.set_id(char_data["id"])
    end
end
```

Beautiful ✨

### State Pattern

The main loop if the game is himself a State Pattern, like, scene management is state pattern, one scene can go to the other by updating the scene of the Game. So this is a good example of the state pattern !

```ruby
# Simplified code
class Game
    def initialize
      @current_scene = MainMenuScene.new(self)
    end
  
    def update
      @current_scene.update
    end
  
    def draw
      @current_scene.draw
    end
  
    def button_down(id)
      @current_scene.button_down(id)
    end
  
    def change_scene(scene)
      @current_scene = scene
    end
end

class MenuScene < Scene
  def initialize(game)
    @game = game
  end

  def update
   # update logics
  end

  def draw
    # draw code...
  end

  def button_down(id)
    if id == "enter"
        @game.change_scene(CreateCharacterScene.new(@game))
    end
  end
end
```

### Observer Pattern

### Decorator Pattern

