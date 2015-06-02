# Write your code here!

def game_hash
    game_hash = {
        :home => {
            :team_name => "Brooklyn Nets", 
            :colors => ["Black", "White"], 
            :players=> {
                :Alan => {
                :number => 0,
                :shoe => 16,
                :points => 22,
                :rebounds => 12,
                :assists => 12,
                :steals => 3,
                :blocks => 1,
                :slam_dunks => 1
                },
                :Reggie => {
                :number => 30,
                :shoe => 14,
                :points => 12,
                :rebounds => 12,
                :assists => 12,
                :steals => 12,
                :blocks => 12,
                :slam_dunks => 7
                },
                :Brook => {
                :number => 11,
                :shoe => 17,
                :points => 17,
                :rebounds => 19,
                :assists => 10,
                :steals => 3,
                :blocks => 1,
                :slam_dunks => 15
                },
                :Mason => {
                :number => 1,
                :shoe => 19,
                :points => 26,
                :rebounds => 12,
                :assists => 6,
                :steals => 3,
                :blocks => 8,
                :slam_dunks => 5
                },
                :Jason => {
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
            :team_name => "Charlotte Hornets", 
            :colors =>  ["Turquoise", "Purple"], 
            :players=> {
                :Jeff => {
                :number => 4,
                :shoe => 18,
                :points => 10,
                :rebounds => 1,
                :assists => 1,
                :steals => 2,
                :blocks => 7,
                :slam_dunks => 2
                },
                :Bismak => {
                :number => 0,
                :shoe => 16,
                :points => 12,
                :rebounds => 4,
                :assists => 7,
                :steals => 7,
                :blocks => 15,
                :slam_dunks => 10
                },
                :DeSagna => {
                :number => 2,
                :shoe => 14,
                :points => 24,
                :rebounds => 12,
                :assists => 12,
                :steals => 4,
                :blocks => 5,
                :slam_dunks => 5
                },
                :Ben => {
                :number => 8,
                :shoe => 15,
                :points => 33,
                :rebounds => 3,
                :assists => 2,
                :steals => 1,
                :blocks => 1,
                :slam_dunks => 0
                },
                :Brendan => {
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

def num_points_scored(player)
    newname = player.split(" ").shift.to_sym
    if game_hash[:away][:players].has_key?(newname)
        return game_hash[:away][:players][newname][:points]
    else
       game_hash[:home][:players].has_key?(newname)
        return game_hash[:home][:players][newname][:points] 
    end
end

def shoe_size(player)
    newname = player.split(" ").shift.to_sym
    if game_hash[:away][:players].has_key?(newname)
        return game_hash[:away][:players][newname][:shoe]
    else
       game_hash[:home][:players].has_key?(newname)
        return game_hash[:home][:players][newname][:shoe] 
    end
end

def team_colors(team)
    if game_hash[:away][:team_name] == team
        return game_hash[:away][:colors]
    else
        return game_hash[:home][:colors]
    end
end

def team_names()
    teams = []
    teams << game_hash[:away][:team_name]
    teams << game_hash[:home][:team_name]
    return teams
end

def player_numbers(team)
    arr = []
    if game_hash[:away][:team_name] == team
        game_hash[:away][:players].each do |player,name|
            arr << name[:number]
        end
    elsif
        game_hash[:home][:players].each do |player,name|
            arr << name[:number]
        end
    end
    return arr
end

def player_stats(player)
    newname = player.split(" ").shift.to_sym
    if game_hash[:away][:players].has_key?(newname)
        return game_hash[:away][:players][newname]
    else
       game_hash[:home][:players].has_key?(newname)
        return game_hash[:home][:players][newname]
    end
end

def big_shoe_rebounds()
    largest_shoe = 0
    largest_shoe_rebounds = 0
    game_hash[:home][:players].each do |players,name|
        if name[:shoe] > largest_shoe
            largest_shoe = name[:shoe]
            largest_shoe_rebounds = name[:rebounds]
        end
    end
    game_hash[:away][:players].each do |players,name|
        if name[:shoe] > largest_shoe
            largest_shoe = name[:shoe]
            largest_shoe_rebounds = name[:rebounds]
        end
    end
    return largest_shoe_rebounds
end

