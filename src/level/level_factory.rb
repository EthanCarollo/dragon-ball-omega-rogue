class LevelFactory 
    def self.get_default_level
        return [
            Level.new("Vegeta, king of dark grrr", "Just kill Vegeta", "./assets/level/vegeta_level.png", CharacterFactory.createVegetaCharacter),
            Level.new("Friea, weird white guy", "Just kill Frieza", "./assets/level/frieza_level.png", CharacterFactory.createFriezaCharacter)
        ]
    end
end 