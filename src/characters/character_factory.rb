# Factory Builder, yes yes i know
class CharacterFactory
    def self.createVegetaCharacter()
        SayanCharacter.new("Vegeta", 78)
            .add_head(PartFactory.create_vegeta_head)
            .add_body(PartFactory.create_vegeta_body)
            .add_stats(CharacterStats.new(8, 6, 15))
            .add_attack(StrengthAttack.new("Fulguro Fist", 14, 15, "./assets/ability/release_v1.2-single_17.png"))
            .add_attack(IntelligenceAttack.new("Kikoha", 8, 24, "./assets/ability/release_v1.2-single_6.png"))
            .add_attack(IntelligenceAttack.new("Masenko", 3, 30, "./assets/ability/release_v1.2-single_10.png"))
    end

    def self.createFriezaCharacter()
        SayanCharacter.new("Frieza", 190)
            .add_head(PartFactory.create_frieza_part)
            .add_body(PartFactory.create_frieza_part)
            .add_stats(CharacterStats.new(54, 24, 19))
            .add_attack(StrengthAttack.new("Fulguro Fist", 14, 15, "./assets/ability/release_v1.2-single_17.png"))
            .add_attack(IntelligenceAttack.new("Kikoha", 8, 24, "./assets/ability/release_v1.2-single_6.png"))
            .add_attack(IntelligenceAttack.new("Masenko", 3, 30, "./assets/ability/release_v1.2-single_10.png"))
    end

    def self.createBuuCharacter()
        NormalCharacter.new("Buu", 540)
                      .add_head(PartFactory.create_buu_part)
                      .add_body(PartFactory.create_buu_part)
                      .add_stats(CharacterStats.new(30, 50, 19))
                      .add_attack(StrengthAttack.new("Kameha", 40, 90, "./assets/ability/release_v1.2-single_17.png"))
    end

    def self.createZamasuCharacter()
        NormalCharacter.new("Zamasu", 1333)
                      .add_head(PartFactory.create_zamasu_part)
                      .add_body(PartFactory.create_zamasu_part)
                      .add_stats(CharacterStats.new(98, 130, 19))
                      .add_attack(StrengthAttack.new("Kameha", 80, 300, "./assets/ability/release_v1.2-single_17.png"))
    end
end