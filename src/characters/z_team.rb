# This is the demonstration of the composite pattern.

class ZTeam < Character
    def initialize(name)
      super(name)
      @members = []
    end

    def hp
        hp = 0
        @members.each do |member|
            hp += member.hp
        end
        hp 
    end

    def max_hb
        max_hb = 0
        @members.each do |member|
            max_hb += member.max_hb
        end
        max_hb 
    end

    def stats
        total_stats = CharacterStats.new(0, 0, 0)
    
        @members.each do |member|
          if member.stats
            total_stats.intelligence += member.stats.intelligence
            total_stats.strength += member.stats.strength
            total_stats.wisdom += member.stats.wisdom
          end
        end
    
        total_stats 
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
        offset_y = 0
        offset_x = 0
        @members.each do |member|
            member.draw_at(x + offset_x, y + offset_y, reversed, draw_health, desired_size)
            offset_y += 30
            offset_x += 90
        end
    end
  end
  