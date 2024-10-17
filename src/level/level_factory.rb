class LevelFactory
	def self.create_level_from_json(level_data)
		if level_data.key?("team")
			team = ZTeam.new(level_data["team"]["name"])
			level_data["team"]["members"].each do |member_id|
				character = CharacterData.instance.get_character(member_id)
				team.add_member(character)
			end
			Level.new(level_data["title"], level_data["description"], team, level_data["difficulty"])
		elsif level_data.key?("character")
			character = CharacterData.instance.get_character(level_data['character'])
			Level.new(level_data["title"], level_data["description"], character, level_data["difficulty"])
		else
			raise "Invalid level data: #{level_data}"
		end
	end

	def self.get_random_level
		easy_level = LevelData.instance.get_levels_by_difficulty("easy").sample
		easy_level2 = LevelData.instance.get_levels_by_difficulty("easy").reject { |level| level.name == easy_level.name }.sample
		medium_level = LevelData.instance.get_levels_by_difficulty("medium").sample
		high_level = LevelData.instance.get_levels_by_difficulty("hard").sample
		[easy_level, easy_level2, medium_level, high_level].shuffle
	end
end 