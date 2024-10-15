require 'gosu'
require_relative 'scenes/menu_scene'
require_relative 'scenes/game_scene'

class Game < Gosu::Window
    WIDTH = 640
    HEIGHT = 480
  
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