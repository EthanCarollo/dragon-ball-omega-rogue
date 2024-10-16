class IntelligenceTraining < Training
    attr_accessor :name, :cost, :amount
  
    def initialize(name, cost, amount)
        super(name, cost)
        @amount = amount
    end
  
    def activate(player)
      puts "intelligence training : #{@name} a été activé par #{player.name}."
      player.character.stats.intelligence += @amount
    end
  end