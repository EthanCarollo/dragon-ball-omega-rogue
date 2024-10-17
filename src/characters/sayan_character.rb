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
		aura_image = @state.current_aura_image
		desired_width = desired_size
		desired_height = desired_size
		if aura_image != nil 
			scale = (desired_width.to_f+120) / aura_image.width
			puts scale
			aura_x = x
			aura_y = y
			aura_image.draw(aura_x - 60, aura_y - 130, 0, scale, scale)
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