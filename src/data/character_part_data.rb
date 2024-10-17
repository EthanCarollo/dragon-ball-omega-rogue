require 'yaml'

class CharacterDataPart
    @instance = nil
  
    def self.instance
      @instance ||= new
    end
  
    attr_reader :data
  
    def initialize
      load_yaml
    end
  
    def get_value(key)
        @data[key]
    end
    
    private
  
    def load_yaml
      @data = YAML.load_file('./data/character_part.yaml')
    rescue Errno::ENOENT
      puts "Le fichier YAML n'a pas été trouvé."
      @data = {}
    rescue Psych::SyntaxError => e
      puts "Erreur de syntaxe dans le fichier YAML : #{e.message}"
      @data = {}
    end
end