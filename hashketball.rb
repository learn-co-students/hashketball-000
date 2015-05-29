def game_hash
  game_hash = {
    :home => {:team_name => "Brooklyn Nets", :colors => ["Black", "White"], :players=> 
    {
        :Alan_stats => {
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1
        },
        :Reggie_stats => {
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7
        },
        :Brook_stats => {
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15
        },
        :Mason_stats => {
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 12,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5
        },
        :Jason_stats => {
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1
        }
    }},
    :away => {:team_name => "Charlotte Hornets", :colors =>  ["Turquoise", "Purple"], :players=> 
    {
        :Jeff_stats => {
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2
        },
        :Bismak_stats => {
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 7,
        :blocks => 15,
        :slam_dunks => 10
        },
        :DeSagna_stats => {
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5
        },
        :Ben_stats => {
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0
        },
        :Brendan_stats => {
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
    }}  
end

def num_points_scored(player)
    result = 0
    name = player.split(' ')[0]
    game_hash[:home][:players].keys.each {|player| if player.to_s.split("_")[0]== name then result = game_hash[:home][:players][player][:points].to_i end}
        if result == 0 then
            game_hash[:away][:players].keys.each {|player| if player.to_s.split("_")[0] == name then result = game_hash[:away][:players][player][:points].to_i end}
    end
    result
end

def shoe_size(player)
    result = 0
    name = player.split(' ')[0]
    game_hash[:home][:players].keys.each {|player| if player.to_s.split("_")[0]== name then result = game_hash[:home][:players][player][:shoe].to_i end}
        if result == 0 then
            game_hash[:away][:players].keys.each {|player| if player.to_s.split("_")[0] == name then result = game_hash[:away][:players][player][:shoe].to_i end}
    end
    result
end

def team_colors(team) 
    if team == "Brooklyn Nets" then game_hash[:home][:colors] #I know this is cheating
    elsif team == "Charlotte Hornets" then game_hash[:away][:colors]
    end
end

def team_names
    array = []
    array << game_hash[:home][:team_name]
    array << game_hash[:away][:team_name]
end

def player_numbers(team)
    array = []
    if game_hash[:home][:team_name] == team then 
        game_hash[:home][:players].keys.each {|player| array << game_hash[:home][:players][player][:number].to_i}
    elsif game_hash[:away][:team_name] == team then
        game_hash[:away][:players].keys.each {|player| array << game_hash[:away][:players][player][:number].to_i}
    end
    array
end

def player_stats(player)
    result = Hash.new
    name = player.split(' ')[0]
    game_hash[:home][:players].keys.each {|player| if player.to_s.split("_")[0]== name then result = game_hash[:home][:players][player] and puts result end}
        if result == 0 then
            game_hash[:away][:players].keys.each {|player| if player.to_s.split("_")[0] == name then result = game_hash[:away][:players][player] and puts result end}
        end
    result
end

def big_shoe_rebounds
    result = 0
    shoesize = 0
    game_hash[:home][:players].keys.each {|player| if game_hash[:home][:players][player][:shoe] > result then result = game_hash[:home][:players][player][:shoe] and shoesize = game_hash[:home][:players][player][:rebounds] end}
    game_hash[:away][:players].keys.each {|player| if game_hash[:away][:players][player][:shoe] > result then result = game_hash[:away][:players][player][:shoe] and shoesize = game_hash[:home][:players][player][:rebounds] end}
    shoesize
end





