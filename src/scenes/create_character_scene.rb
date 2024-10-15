class CreateCharacterScene
    def initialize(window)
        @window = window
      @character_name = ""
      @font = Gosu::Font.new(20)
      @cursor_visible = true
      @input_active = false  # Pour vérifier si le champ est actif
      @submit_button_width = 120
      @submit_button_height = 30
      @input_x = (1280 - @font.text_width("Enter Character Name: #{@character_name}")) / 2
      @input_y = 720 - 120
    end
  
    def update
      # Toggle cursor visibility
      @cursor_visible = !@cursor_visible if Gosu.button_down?(Gosu::KB_SPACE)
    end
  
    def draw
      # Dessiner le champ de saisie centré en bas
      @font.draw_text("Enter Character Name: #{@character_name}", @input_x, @input_y, 0)
  
      # Dessiner le bouton de soumission centré en bas
      submit_button_x = (1280 - @submit_button_width) / 2
      submit_button_y = @input_y + 40
      Gosu.draw_rect(submit_button_x, submit_button_y, @submit_button_width, @submit_button_height, Gosu::Color::GRAY)
      @font.draw_text("Submit", submit_button_x + 10, submit_button_y + 5, 0)
  
      # Afficher le curseur
      if @cursor_visible && @input_active
        @font.draw_text("_", @input_x + @font.text_width(@character_name), @input_y, 0)
      end
  
      @font.draw_text("Press ESC to exit.", 20, 20, 0)
    end
  
    def button_down(id)
      case id
      when Gosu::MS_LEFT
        # Vérifiez si l'utilisateur a cliqué sur le bouton de soumission
        submit_button_x = (1280 - @submit_button_width) / 2
        submit_button_y = 720 - 60 + 40
        if  @window.mouse_x.between?(submit_button_x, submit_button_x + @submit_button_width) &&
           @window.mouse_y.between?(submit_button_y, submit_button_y + @submit_button_height)
          submit_character
        end
  
        # Vérifiez si l'utilisateur a cliqué dans le champ de saisie
        if  @window.mouse_x.between?(@input_x, @input_x + @font.text_width("Enter Character Name: #{@character_name}")) &&
           @window.mouse_y.between?(@input_y - 20, @input_y + 20) # Ajustez les valeurs en fonction de la hauteur du texte
          @input_active = true
        else
          @input_active = false
        end
      end
  
      if @input_active
        case id
        when Gosu::KB_BACKSPACE
          @character_name.chop! if @character_name.length > 0
        when Gosu::KB_RETURN
          submit_character
        else
          if id >= Gosu::KB_A && id <= Gosu::KB_Z
            @character_name << (id - Gosu::KB_A + 65).chr
          end
        end
      end
    end
  
    def submit_character
      puts "Character created with name: #{@character_name}"
      @character_name = "" # Réinitialiser le nom après la création
      @input_active = false # Désactiver le champ après soumission
    end
  end