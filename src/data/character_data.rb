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

    def get_character(name)
        @characters.find { |character| character.name == name }
    end

    private def load_json
        file = File.read('./data/character.json')
        json_data = JSON.parse(file)
        @characters = json_data['data'].map do |char_data|
            char = CharacterFactory.create_character_from_json(char_data)
            puts "SUCCESS : Successfully create character : #{char_data['name']}"
            char
        end
    rescue Errno::ENOENT
        puts "Le fichier JSON n'a pas été trouvé."
        @data = {}
    rescue JSON::ParserError => e
        puts "Erreur de syntaxe dans le fichier JSON : #{e.message}"
        @data = {}
    end
end
