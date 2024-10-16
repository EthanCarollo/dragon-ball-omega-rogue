require 'gosu'

require_relative 'events/event_manager'

require_relative 'ui/button'
require_relative 'ui/training_button'
require_relative 'ui/image_button'
require_relative 'ui/button_factory'
require_relative 'ui/input'
require_relative 'ui/input_factory'
require_relative 'ui/text_with_background'
require_relative 'ui/text_with_background_factory'
require_relative 'ui/text_display'

require_relative 'player/training/training'
require_relative 'player/training/super_sayan_training'
require_relative 'player/training/training_manager'
require_relative 'player/player'

require_relative 'characters/attack/attack_option'
require_relative 'characters/attack/strength_attack'
require_relative 'characters/attack/intelligence_attack'
require_relative 'characters/character'
require_relative 'characters/character_stats'
require_relative 'characters/character_factory'
require_relative 'characters/state/character_state'

require_relative 'scenes/menu_scene'
require_relative 'scenes/reward_scene'
require_relative 'scenes/combat_scene'
require_relative 'scenes/create_character_scene'
require_relative 'scenes/create_character/custom_character_component'
require_relative 'scenes/create_character/part_component'
require_relative 'scenes/game_scene'
require_relative 'scenes/game/training_component'
require_relative 'scenes/game/launch_fight_component'
require_relative 'scenes/game/stats_component'


# In fact, the whole scene managing of the game is a sort of state machine lol, in some funny way
class Game < Gosu::Window
    WIDTH = 1280
    HEIGHT = 720

    attr_reader :event_manager
  
    def initialize
      super(WIDTH, HEIGHT)
      self.caption = "Dragon Ball Omega Rogue"

      @current_scene = MenuScene.new(self)

      # Observer pattern here boss
      @event_manager = EventManager.new
      @text_display = TextDisplay.new(self)
      @event_manager.add_observer(@text_display)
      @event_manager.notify("Bienvenue dans ce jeu bel homme")
    end
  
    def update
      delta_time = Gosu::milliseconds / 1000.0
      @text_display.update(delta_time)

      @current_scene.update
    end
  
    def draw
      @current_scene.draw

      @text_display.draw
    end
  
    def button_down(id)
      @current_scene.button_down(id)
    end
  
    def change_scene(scene)
      @current_scene = scene
    end
  end