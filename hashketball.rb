require "pry"

def game_hash
	game_hash = {
		:home => {
			:team_name => ["Brooklyn Nets"],
			:colors => ["Black", "White"],
			:players => {
				"Alan Anderson" => {
					:number => 0,
					:shoe => 16,
					:points => 22,
					:rebounds => 12,
					:assists => 12,
					:steals => 3,
					:blocks => 1,
					:slam_dunks => 1
				},
				"Reggie Evans" => {
					:number => 30,
					:shoe => 14,
					:points => 12,
					:rebounds => 12,
					:assists => 12,
					:steals => 12,
					:blocks => 12,
					:slam_dunks => 7
				},
				"Brook Lopez" => {
					:number => 11,
					:shoe => 17,
					:points => 17,
					:rebounds => 19,
					:assists => 10,
					:steals => 3,
					:blocks => 1,
					:slam_dunks => 15
				},
				"Mason Plumlee" => {
					:number => 1,
					:shoe => 19,
					:points => 26,
					:rebounds => 12,
					:assists => 6,
					:steals => 3,
					:blocks => 8,
					:slam_dunks => 5
				},
				"Jason Terry" => {
					:number => 31,
					:shoe => 15,
					:points => 19,
					:rebounds => 2,
					:assists => 2,
					:steals => 4,
					:blocks => 11,
					:slam_dunks => 1	
				}
			}	
		},
		:away => {
			:team_name => ["Charlotte Hornets"],
			:colors => ["Turquoise", "Purple"],
			:players => {
				"Jeff Adrien" => {
					:number => 4,
					:shoe => 18,
					:points => 10,
					:rebounds => 1,
					:assists => 1,
					:steals => 2,
					:blocks => 7,
					:slam_dunks => 2
				},
				"Bismak Biyombo" => {
					:number => 0,
					:shoe => 16,
					:points => 12,
					:rebounds => 4,
					:assists => 7,
					:steals => 7,
					:blocks => 15,
					:slam_dunks => 10
				},
				"DeSagna Diop" => {
					:number => 2,
					:shoe => 14,
					:points => 24,
					:rebounds => 12,
					:assists => 12,
					:steals => 4,
					:blocks => 5,
					:slam_dunks => 5
				},
				"Ben Gordon" => {
					:number => 8,
					:shoe => 15,
					:points => 33,
					:rebounds => 3,
					:assists => 2,
					:steals => 1,
					:blocks => 1,
					:slam_dunks => 0
				},	
				"Brendan Haywood" => {
					:number => 33,
					:shoe => 15,
					:points => 6,
					:rebounds => 12,
					:assists => 12,
					:steals => 22,
					:blocks => 5,
					:slam_dunks => 12
				}
			}	
		}
	}
end

def num_points_scored(player_name)
	game_hash.each do |team, specs|
		specs.each do |details, values|
			values.each do |stuff, more_stuff|
				if stuff == player_name
					return more_stuff[:points]
				end
			end
		end
	end
end

def shoe_size(player_name)
	game_hash.each do |team, specs|
		specs.each do |details, values|
			values.each do |stuff, more_stuff|
				if stuff == player_name
					return more_stuff[:shoe]
				end
			end
		end
	end
end

def team_colors(team_name)
	game_hash.each do |team, specs|
		specs.each do |details, values|
			if values == [team_name]
				return specs[:colors]
			end
		end
	end
end

def team_names
	one_team = game_hash[:home][:team_name]
	other_team = game_hash[:away][:team_name]
	one_team + other_team
end

def player_numbers(team_name)
	game_hash.each do |team, specs|
		if specs[:team_name] == [team_name] then
			team_numbers = []
			specs[:players].each do |details, values|
				team_numbers<<values[:number]
			end
			return team_numbers
		end
	end
end

def player_stats(name)
	game_hash.each do |team, specs|
		specs.each do |details, values|
			values.each do |stuff, more_stuff|
				if stuff == name
					return more_stuff
				end
			end
		end
	end
end

def big_shoe_rebounds
	shoe_sizes = []
	game_hash[:home][:players].each do |player, stats|
		shoe_sizes<<stats[:shoe]
	end
	game_hash[:away][:players].each do |player, stats|
		shoe_sizes<<stats[:shoe]
	end
	largest_size = shoe_sizes.sort.last
	game_hash[:home][:players].each do |player, stats|
		if stats[:shoe] == largest_size
			return stats[:rebounds]
		end
	end
	game_hash[:away][:players].each do |player, stats|
		if stats[:shoe] == largest_size
			return stats[:rebounds]
		end
	end
end

def most_points_scored
	scores = []
	game_hash[:home][:players].each do |player, stats|
		scores<<stats[:points]
	end
	game_hash[:away][:players].each do |player, stats|
		scores<<stats[:points]
	end
	largest_score = scores.sort.last
	game_hash[:home][:players].each do |player, stats|
		if stats[:points] == largest_score
			return player
		end
	end
	game_hash[:away][:players].each do |player, stats|
		if stats[:points] == largest_score
			return player
		end
	end
end

def winning_team
	home_scores = []
	away_scores = []
	game_hash[:home][:players].each do |player, stats|
		home_scores<<stats[:points]
	end
	home_total = home_scores.reduce(:+)
	game_hash[:away][:players].each do |player, stats|
		away_scores<<stats[:points]
	end
	away_total = away_scores.reduce(:+)

	if away_total > home_total
		return game_hash[:away][:team_name][0]
	else
		return game_hash[:home][:team_name][0]
	end
end

def player_with_longest_name
	name_lengths = []
	game_hash[:home][:players].each do |player, stats|
		name_lengths<<player.length
	end
	game_hash[:away][:players].each do |player, stats|
		name_lengths<<player.length
	end
	longest_length = name_lengths.sort.last
	game_hash[:home][:players].each do |player, stats|
		if player.length == longest_length
			return player
		end
	end
	game_hash[:away][:players].each do |player, stats|
		if player.length == longest_length
			return player
		end
	end
end

def long_name_steals_a_ton?
	name_lengths = []
	long_name = ""
	game_hash[:home][:players].each do |player, stats|
		name_lengths<<player.length
	end
	game_hash[:away][:players].each do |player, stats|
		name_lengths<<player.length
	end
	longest_length = name_lengths.sort.last
	game_hash[:home][:players].each do |player, stats|
		if player.length == longest_length
			long_name<<player
		end
	end
	game_hash[:away][:players].each do |player, stats|
		if player.length == longest_length
			long_name<<player
		end
	end
	steals = []
	biggest_stealer = ""
	game_hash[:home][:players].each do |player, stats|
		steals<<stats[:steals]
	end
	game_hash[:away][:players].each do |player, stats|
		steals<<stats[:steals]
	end
	most_steals = steals.sort.last
	game_hash[:home][:players].each do |player, stats|
		if stats[:steals] == most_steals
			biggest_stealer<<player
		end
	end
	game_hash[:away][:players].each do |player, stats|
		if stats[:steals] == most_steals
			biggest_stealer<<player
		end
	end
	long_name == biggest_stealer
end










