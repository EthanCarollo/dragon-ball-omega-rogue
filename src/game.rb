require 'gosu'

require_relative 'ui/button'
require_relative 'ui/button_factory'
require_relative 'ui/input'
require_relative 'ui/input_factory'
require_relative 'ui/text_with_background'
require_relative 'ui/text_with_background_factory'

require_relative 'player/player'

require_relative 'characters/attack/attack_option'
require_relative 'characters/attack/classic_attack'
require_relative 'characters/character'
require_relative 'characters/player_character'

require_relative 'scenes/menu_scene'
require_relative 'scenes/combat_scene'
require_relative 'scenes/create_character_scene'
require_relative 'scenes/create_character/custom_character_component'
require_relative 'scenes/create_character/part_component'
require_relative 'scenes/game_scene'

# In fact, the whole scene managing of the game is a sort of state machine lol, in some funny way
class Game < Gosu::Window
    WIDTH = 1280
    HEIGHT = 720
  
    def initialize
      super(WIDTH, HEIGHT)
      self.caption = "Ruby Gosu Scene Switching"
      
      # Start with the MenuScene
      @current_scene = MenuScene.new(self)
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