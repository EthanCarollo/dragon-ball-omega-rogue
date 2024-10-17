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
            create_character(char_data)
        end
    rescue Errno::ENOENT
        puts "Le fichier JSON n'a pas été trouvé."
        @data = {}
    rescue JSON::ParserError => e
        puts "Erreur de syntaxe dans le fichier JSON : #{e.message}"
        @data = {}
    end

    private def create_character(char_data)
        character = NormalCharacter.new(char_data['name'], 34)
                        .add_head(Part.new(char_data["full_body"]))
                        .add_body(Part.new(char_data["full_body"]))
                        .add_stats(CharacterStats.new(char_data['stats']['strength'], char_data['stats']['intelligence'], char_data['stats']['wisdom']))
        char_data['attack'].each do |attack_data|
            if attack_data["type"] == "strength"
                character.add_attack(StrengthAttack.new(attack_data['name'], 
                                                    attack_data['min'], 
                                                    attack_data['max']))
            elsif attack_data["type"] == "intelligence"
                character.add_attack(StrengthAttack.new(attack_data['name'], 
                                                    attack_data['min'], 
                                                    attack_data['max']))
            else   
                puts "WARNING : attack type of #{attack_data["type"]} doesn't exist in character_data.rb"
            end
        end
        puts "SUCCESS : Successfully create character : #{char_data['name']}"
        character
    end
end
