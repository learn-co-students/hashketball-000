# Write your code here!
def game_hash
  return {
  :home => {
    :team_name => "Brooklyn Nets",
	:colors => ["Black", "White"],
	:players => [
	  {
	    :name => "Alan Anderson",
	    :number => 0,
	    :shoe => 16,
	      :points => 22,
		  :rebounds => 12,
		  :assists => 12,
		  :steals => 3,
		  :blocks => 1,
		  :slam_dunks => 1
	  },
	  {
	    :name => "Reggie Evans",
	    :number => 30,
	    :shoe => 14,
	      :points => 12,
		  :rebounds => 12,
		  :assists => 12,
		  :steals => 12,
		  :blocks => 12,
		  :slam_dunks => 7
	  },
	  {
	    :name => "Brook Lopez",
	    :number => 11,
	    :shoe => 17,
	      :points => 17,
		  :rebounds => 19,
		  :assists => 10,
		  :steals => 3,
		  :blocks => 1,
		  :slam_dunks => 15
	  },
	  {
	    :name => "Mason Plumlee",
	    :number => 1,
	    :shoe => 19,
	      :points => 26,
		  :rebounds => 12,
		  :assists => 6,
		  :steals => 3,
		  :blocks => 8,
		  :slam_dunks => 5
	  },
	  {
	    :name => "Jason Terry",
	    :number => 31,
	    :shoe => 15,
	      :points => 19,
		  :rebounds => 2,
		  :assists => 2,
		  :steals => 4,
		  :blocks => 11,
		  :slam_dunks => 1
	  }
	]
  },
  :away => {
    :team_name => "Charlotte Hornets",
	:colors => ["Turquoise", "Purple"],
	:players => [
	  {
	    :name => "Jeff Adrien",
	    :number => 4,
	    :shoe => 18,
	      :points => 10,
		  :rebounds => 1,
		  :assists => 1,
		  :steals => 2,
		  :blocks => 7,
		  :slam_dunks => 2
	  },
	  {
	    :name => "Bismak Biyombo",
	    :number => 0,
	    :shoe => 16,
	      :points => 12,
		  :rebounds => 4,
		  :assists => 7,
		  :steals => 7,
		  :blocks => 15,
		  :slam_dunks => 10
	  },
	  {
	    :name => "DeSagna Diop",
	    :number => 2,
	    :shoe => 14,
	      :points => 24,
		  :rebounds => 12,
		  :assists => 12,
		  :steals => 4,
		  :blocks => 5,
		  :slam_dunks => 5
	  },
	  {
	    :name => "Ben Gordon",
	    :number => 8,
	    :shoe => 15,
	      :points => 33,
		  :rebounds => 3,
		  :assists => 2,
		  :steals => 1,
		  :blocks => 1,
		  :slam_dunks => 0
	  },
	  {
	    :name => "Brendan Haywood",
	    :number => 33,
	    :shoe => 15,
	      :points => 6,
		  :rebounds => 12,
		  :assists => 12,
		  :steals => 22,
		  :blocks => 5,
		  :slam_dunks => 12
	  }
	]
  }
  }
end  

def detect_player(name)
  hsh = game_hash
  obj = hsh[:home][:players].detect { |e| e[:name] == name }
  if obj == nil then
    obj = hsh[:away][:players].detect { |e| e[:name] == name }
  end
  obj
end

def num_points_scored(name)
  obj = detect_player(name)
  obj[:points]
end

def shoe_size(name)
  obj = detect_player(name)
  obj[:shoe]
end

def get_team(name)
  hsh = game_hash
  if hsh[:home][:team_name] == name then
    hsh[:home]
  else
    hsh[:away]
  end	
end

def team_colors(name)
  get_team(name)[:colors]
end

def team_names
  hsh = game_hash
  [hsh[:home][:team_name], hsh[:away][:team_name]]
end

def player_numbers(team_name)
  get_team(team_name)[:players].each_with_object([]) { |e, arr| arr << e[:number] }
end

def player_stats(name)
  obj = detect_player(name)
  obj.delete(:name)
  obj
end

def big_shoe_rebounds
  hsh = game_hash
  big_home = hsh[:home][:players].sort_by { |e| -e[:shoe] }[0]
  big_away = hsh[:away][:players].sort_by { |e| -e[:shoe] }[0]
  big_home[:shoe] > big_away[:shoe] ? big_home[:rebounds] : big_away[:rebounds]
end

def most_points_scored
  hsh = game_hash
  most_home = hsh[:home][:players].sort_by { |e| -num_points_scored(e[:name]) }[0]
  most_away = hsh[:away][:players].sort_by { |e| -num_points_scored(e[:name]) }[0]
  most_home[:points] > most_away[:points] ? most_home[:name] : most_away[:name]
end

def winning_team
  hsh = game_hash
  home = hsh[:home][:players].reduce(0) { |sum, player| sum + player[:points] }
  away = hsh[:away][:players].reduce(0) { |sum, player| sum + player[:points] }
  home > away ? hsh[:home][:team_name] : hsh[:away][:team_name]
end

def player_with_longest_name
  hsh = game_hash
  longest_home = hsh[:home][:players].sort_by { |e| -e[:name].length }[0]
  longest_away = hsh[:away][:players].sort_by { |e| -e[:name].length }[0]
  longest_home[:name].length > longest_away[:name].length ? longest_home[:name] : longest_away[:name]
end
def most_steals_gained
  hsh = game_hash
  most_home = hsh[:home][:players].sort_by { |e| -e[:steals] }[0]
  most_away = hsh[:away][:players].sort_by { |e| -e[:steals] }[0]
  most_home[:steals] > most_away[:steals] ? most_home[:name] : most_away[:name]
end

def long_name_steals_a_ton?
  most_steals_gained == player_with_longest_name
end