class LevelFactory
    def self.get_easy_level
        [
          Level.new("C17, kill him fock", "Just kill C17", CharacterFactory.createC17Character, RewardFactory.get_ssj_reward),
          Level.new("Vegeta, king of dark grrr", "Just kill Vegeta", CharacterFactory.createVegetaCharacter, RewardFactory.get_ssj_reward),
          Level.new("Dabra", "Dabra is not a good guy :'(", CharacterFactory.createDabraCharacter),
          Level.new("Kaio", "Kaio is a good guy :'(", CharacterFactory.createKaioCharacter, RewardFactory.get_ssj_reward),
        ]
    end

    def self.get_medium_level
        [
          Level.new("KILL BUU PLZ", "Just kill Buu", CharacterFactory.createBuuCharacter),
          Level.new("Frieza, weird white guy", "Just kill Frieza", CharacterFactory.createFriezaCharacter)
        ]
    end

    def self.get_high_level
        [
          Level.new("Fock.. Zamasu", "Just kill Zamasu", CharacterFactory.createZamasuCharacter),
          Level.new("Kill Hit", "Just kill Hit", CharacterFactory.createHitCharacter),
          Level.new("Kill Beerus", "Just kill Beerus", CharacterFactory.createBeerusCharacter)
        ]
    end

    def self.get_random_level
        easy_level = get_easy_level.sample
        easy_level2 = get_easy_level.reject { |level| level.name == easy_level.name }.sample
        medium_level = get_medium_level.sample
        high_level = get_high_level.sample
        [easy_level, easy_level2, medium_level, high_level].shuffle
    end
end 