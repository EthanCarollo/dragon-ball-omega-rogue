require 'json'

class LevelData
    @instance = nil

    def self.instance
        @instance ||= new
    end

    attr_reader :data

    def initialize
        load_json
    end

    def get_level(name)
        @level.find { |level| level.name == name }
    end


    def get_levels_by_difficulty(difficulty)
        @levels.select { |level| level.difficulty == difficulty }
    end


    private def load_json
        file = File.read('./data/levels.json')
        json_data = JSON.parse(file)
        @levels = json_data['data'].map do |level_data|
            level = LevelFactory.create_level_from_json(level_data)
            puts "SUCCESS : Successfully create level : #{level.name}"
            level
        end
    rescue Errno::ENOENT
        puts "Le fichier JSON n'a pas été trouvé."
        @data = {}
    rescue JSON::ParserError => e
        puts "Erreur de syntaxe dans le fichier JSON : #{e.message}"
        @data = {}
    end
end
