require 'json'

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
