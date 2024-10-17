# Factory Builder, yes yes i know
class CharacterFactory
    def self.createVegetaCharacter()
        SayanCharacter.new("Vegeta", 78)
            .add_head(PartFactory.create_vegeta_head)
            .add_body(PartFactory.create_vegeta_body)
            .add_stats(CharacterStats.new(8, 6, 15))
            .add_attack(StrengthAttack.new("Fulguro Fist", 14, 15, ))
            .add_attack(IntelligenceAttack.new("Kikoha", 8, 24, ))
            .add_attack(IntelligenceAttack.new("Masenko", 3, 30, ))
    end

    def self.createFriezaCharacter()
        SayanCharacter.new("Frieza", 190)
            .add_head(PartFactory.create_frieza_part)
            .add_body(PartFactory.create_frieza_part)
            .add_stats(CharacterStats.new(54, 24, 19))
            .add_attack(StrengthAttack.new("Fulguro Fist", 14, 15, ))
            .add_attack(IntelligenceAttack.new("Kikoha", 8, 24, ))
            .add_attack(IntelligenceAttack.new("Masenko", 3, 30, ))
    end

    def self.createBuuCharacter()
        NormalCharacter.new("Buu", 540)
                      .add_head(PartFactory.create_buu_part)
                      .add_body(PartFactory.create_buu_part)
                      .add_stats(CharacterStats.new(30, 50, 19))
                      .add_attack(StrengthAttack.new("Kameha", 40, 90, ))
    end

    def self.createKaioCharacter()
        NormalCharacter.new("Hit", 444)
                       .add_head(PartFactory.create_kaio_part)
                       .add_body(PartFactory.create_kaio_part)
                       .add_stats(CharacterStats.new(2, 1, 4))
                       .add_attack(StrengthAttack.new("Finger stip", 3, 5, ))
    end

    def self.createDabraCharacter()
        NormalCharacter.new("Hit", 120)
                       .add_head(PartFactory.create_dabra_part)
                       .add_body(PartFactory.create_dabra_part)
                       .add_stats(CharacterStats.new(2, 42, 21))
                       .add_attack(StrengthAttack.new("Transform in stone", 3, 40, ))
    end

    def self.createHitCharacter()
        NormalCharacter.new("Hit", 4034)
                       .add_head(PartFactory.create_hit_part)
                       .add_body(PartFactory.create_hit_part)
                       .add_stats(CharacterStats.new(225, 542, 421))
                       .add_attack(StrengthAttack.new("Kameha", 300, 389, ))
    end

    def self.createC17BisCharacter()
        NormalCharacter.new("C17", 34)
                       .add_head(PartFactory.create_c17_bis_part)
                       .add_body(PartFactory.create_c17_bis_part)
                       .add_stats(CharacterStats.new(2, 5, 4))
                       .add_attack(StrengthAttack.new("Kameha", 3, 24, ))
    end

    def self.createC18Character()
        NormalCharacter.new("C18", 34)
                       .add_head(PartFactory.create_c18_part)
                       .add_body(PartFactory.create_c18_part)
                       .add_stats(CharacterStats.new(8, 3, 4))
                       .add_attack(StrengthAttack.new("Kameha", 7, 15, ))
    end

    def self.createC17Character()
        NormalCharacter.new("C17", 429)
                       .add_head(PartFactory.create_c17_part)
                       .add_body(PartFactory.create_c17_part)
                       .add_stats(CharacterStats.new(2, 5, 4))
                       .add_attack(StrengthAttack.new("Kameha", 3, 9, ))
    end

    def self.createBeerusCharacter()
        NormalCharacter.new("Beerus", 9999)
                       .add_head(PartFactory.create_beerus_part)
                       .add_body(PartFactory.create_beerus_part)
                       .add_stats(CharacterStats.new(250, 230, 219))
                       .add_attack(StrengthAttack.new("Kameha", 830, 1300, ))
    end

    def self.createZamasuCharacter()
        NormalCharacter.new("Zamasu", 1333)
                      .add_head(PartFactory.create_zamasu_part)
                      .add_body(PartFactory.create_zamasu_part)
                      .add_stats(CharacterStats.new(98, 130, 19))
                      .add_attack(StrengthAttack.new("Kameha", 80, 300, ))
    end
end