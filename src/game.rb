require 'gosu'

require_relative 'config.rb'

require_relative 'debug/debug_log'
require_relative 'debug/debug_fps'

require_relative 'events/event_manager'

require_relative 'level/level'
require_relative 'level/level_factory'

require_relative 'utils/text_utils'

require_relative 'data/character_part_data'
require_relative 'data/character_data'
require_relative 'data/level_data'

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
require_relative 'player/training/attack_training'
require_relative 'player/training/intelligence_training'
require_relative 'player/training/strength_training'
require_relative 'player/training/training_manager'
require_relative 'player/player'

require_relative 'rewards/reward'
require_relative 'rewards/reward_memento'
require_relative 'rewards/stats_reward'
require_relative 'rewards/training_reward'
require_relative 'rewards/reward_factory'

require_relative 'characters/attack/attack_option'
require_relative 'characters/attack/strength_attack'
require_relative 'characters/attack/intelligence_attack'
require_relative 'characters/attack/super_sayan_attack'
require_relative 'characters/attack/super_sayan_god_attack'
require_relative 'characters/character'
require_relative 'characters/z_team'
require_relative 'characters/normal_character'
require_relative 'characters/sayan_character'
require_relative 'characters/chilled_character'
require_relative 'characters/character_stats'
require_relative 'characters/character_factory'
require_relative 'characters/proxy/proxy_transformation'
require_relative 'characters/state/sayan_state'
require_relative 'characters/state/character_state'

require_relative 'scenes/menu_scene'
require_relative 'scenes/reward_scene'
require_relative 'scenes/combat_scene'
require_relative 'scenes/choose_fight_scene'
require_relative 'scenes/create_character_scene'
require_relative 'scenes/create_character/custom_character_component'
require_relative 'scenes/create_character/part_component'
require_relative 'scenes/game_scene'
require_relative 'scenes/game/training_component'
require_relative 'scenes/game/launch_fight_component'
require_relative 'scenes/game/stats_component'


# In fact, the whole scene managing of the game is a sort of state machine lol, in some funny way
# So that's making this game, a demonstration of the state pattern itself
class Game < Gosu::Window
    WIDTH = WINDOW_WIDTH
    HEIGHT = WINDOW_HEIGHT

    attr_reader :event_manager
  
    def initialize
      super(WIDTH, HEIGHT)
      self.caption = "Dragon Ball Omega Rogue"

      # Call instance of singleton of data to preload them
      # Before the game is launching
      CharacterPartData.instance
      CharacterData.instance
      LevelData.instance
      @debug_fps = DebugFPS.new()

      # Initialize logics
      @current_scene = MenuScene.new(self)
      # @current_scene = RewardScene.new(self, RewardFactory.method(:get_ssj_reward).to_proc)
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
      @debug_fps.draw
    end
  
    def button_down(id)
      @current_scene.button_down(id)
    end
  
    def change_scene(scene)
      @current_scene = scene
    end
end