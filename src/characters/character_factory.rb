# Factory Builder, yes yes i know
class CharacterFactory
    def self.create_character_from_json(char_data)
        char_hp = 0
        begin
            if char_data['hp'] == nil
                raise "error"
            end
            char_hp = char_data['hp']
        rescue
            DebugLog.error("ERROR : Cannot get hp of the character : #{char_data['name']} ")
            char_hp = 100
        end

        if char_data['type'] == "normal"  
            character = NormalCharacter.new(char_data['name'], char_hp)
                                    .add_head(Part.new(char_data['full_body']))
                                    .add_body(Part.new(char_data['full_body']))
                                    .add_stats(CharacterStats.new(char_data['stats']['strength'], 
                                                                    char_data['stats']['intelligence'], 
                                                                    char_data['stats']['wisdom'],
                                                                    char_data['stats']['armor']))
        else 
            DebugLog.warning "ERROR : #{char_data['type']} isn't a valid type in character_factory.rb"
            return
        end

        char_data['attack'].each do |attack_data|
            attack_type = attack_data['type']
            if attack_type == 'strength'
                character.add_attack(StrengthAttack.new(attack_data['name'], 
                                                        attack_data['min'], 
                                                        attack_data['max']))
            elsif attack_type == 'intelligence'
                character.add_attack(IntelligenceAttack.new(attack_data['name'], 
                                                            attack_data['min'], 
                                                            attack_data['max']))
            else
                    DebugLog.warning "WARNING : attack type of #{attack_data["type"]} doesn't exist in character_factory.rb"
            end
        end
    
        character.set_id(char_data["id"])
    end
end