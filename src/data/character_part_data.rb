require 'json'

class CharacterPartData
    attr_accessor :sayan_heads, :sayan_bodys

    @instance = nil

    def self.instance
        @instance ||= new
    end

    attr_reader :data

    def initialize
        load_json
    end

    private def load_json
        file = File.read('./data/character_part.json')
        json_data = JSON.parse(file)

        @sayan_heads = PartComponent.new(
            json_data['head'].map do |part_data|
                part = PartFactory.create_part_component(part_data)
                DebugLog.info "SUCCESS : Successfully create head character part : #{part_data}"
                part
            end
        )

        @sayan_bodys = PartComponent.new(
            json_data['body'].map do |part_data|
                part = PartFactory.create_part_component(part_data)
                DebugLog.info "SUCCESS : Successfully create body character part : #{part_data}"
                part
            end
        )

    rescue Errno::ENOENT
        DebugLog.error "Le fichier JSON n'a pas été trouvé."
        @data = {}
    rescue JSON::ParserError => e
        DebugLog.error "Erreur de syntaxe dans le fichier JSON : #{e.message}"
        @data = {}
    end
end
