class LevelFactory 
    def self.get_default_level
        return [
            LevelFactory.get_vegeta_level,
            LevelFactory.get_frieza_level,
            LevelFactory.get_zamasu_level
        ]
    end

    def self.get_vegeta_level
        Level.new("Vegeta, king of dark grrr", "Just kill Vegeta", "./assets/level/vegeta_level.png", CharacterFactory.createVegetaCharacter)
    end

    def self.get_frieza_level
        Level.new("Friea, weird white guy", "Just kill Frieza", "./assets/level/frieza_level.png", CharacterFactory.createFriezaCharacter)
    end

    def self.get_buu_level
        Level.new("KILL BUU PLZ", "Just kill Buu", "./assets/level/frieza_level.png", CharacterFactory.createBuuCharacter)
    end

    def self.get_zamasu_level
        Level.new("Fock.. Zamasu", "Just kill Zamasu", "./assets/level/frieza_level.png", CharacterFactory.createZamasuCharacter)
    end
end 