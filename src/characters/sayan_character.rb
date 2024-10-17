class SayanCharacter < Character

	attr_accessor :name, :hp, :attack_options, :stats, :head, :body, :max_hp

	def initialize(name, hp = 100)
		super(name, hp)
		@state = SayanDefaultState.new(self)
	end

	def update
		@state.update
	end

	def draw_at(x, y, reversed = false, draw_health = true, desired_size = 128)
		super(x, y, reversed, draw_health, desired_size)
		self.update
		if  @state.current_aura_image != nil
			desired_width = desired_size
			scale = (desired_width.to_f+120) /  @state.current_aura_image.width
			aura_x = x
			aura_y = y
			@state.current_aura_image.draw(aura_x - 60, aura_y - 125, 0, scale, scale)
		end
	end

	def updateState(state)
		@state = state
	end

	def awakenToSSRed
		@state.awakenToSSRed
	end

	def awakenToSSJ
		@state.awakenToSSJ
	end

	def awakenToEgo
		@state.awakenToEgo
	end

end