# Factory Builder, yes yes i know
class CharacterFactory
    def self.createVegetaCharacter()
        Character.new("Vegeta")
            .add_head(PartFactory.create_vegeta_head)
            .add_body(PartFactory.create_vegeta_body)
            .add_stats(CharacterStats.new(10, 10, 10))
            .add_attack(StrengthAttack.new("Fulguro Fist", 14, 15, "./assets/ability/release_v1.2-single_17.png"))
            .add_attack(IntelligenceAttack.new("Kikoha", 8, 24, "./assets/ability/release_v1.2-single_6.png"))
            .add_attack(IntelligenceAttack.new("Masenko", 3, 30, "./assets/ability/release_v1.2-single_10.png"))
    end
end