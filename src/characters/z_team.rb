class ZTeam < Character
    def initialize(name)
      super(name)
      @members = []
    end

    def stats
        CharacterStats.new(5,5,5)
    end
  
    def add_member(character)
      @members << character
      return self
    end
  
    def remove_member(character)
      @members.delete(character)
      return self
    end
  
    def alive?
      @members.any?(&:alive?)
    end
  
    def random_attack(opponent)
      @members.each do |member|
        if member.alive?
          member.random_attack(opponent)
        end
      end
    end
  
    def hit(damage)
      damage_per_member = damage / @members.size.to_f
      @members.each do |member|
        member.hit(damage_per_member)
      end
    end
  
    def heal(heal_point)
      @members.each do |member|
        member.heal(heal_point)
      end
    end
  
    def draw_at(x, y, reversed = false, draw_health = true, desired_size = 128)
        puts "draw Z-Team"
        offset_y = 0
        offset_x = 0
        @members.each do |member|
            member.draw_at(x + offset_x, y + offset_y, reversed, draw_health, desired_size)
            offset_y += 30
            offset_x += 75
        end
    end
  end
  