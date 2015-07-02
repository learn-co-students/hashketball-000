def game_hash

$hash = {:home =>
         {:team_name => "Brooklyn Nets", :colors => ["Black", "White"], :players => 

  [{:name => "Alan Anderson", 
    :shoe_size => 16, 
    :jersey_number => 0, 
    :stats => 
      {:number => 0, 
        :shoe => 16, 
        :points => 22, 
        :rebounds => 12, 
        :assists => 12, 
        :steals => 3, 
        :blocks => 1, 
        :slam_dunks => 1}}, 
  {:name => "Reggie Evans", 
    :shoe_size => 14, 
    :jersey_number => 30, 
    :stats => 
      {:number => 30, 
        :shoe => 14, 
        :points => 12, 
        :rebounds => 12, 
        :assists => 12, 
        :steals => 12, 
        :blocks => 12, 
        :slam_dunks => 7}},
    {:name => "Brook Lopez",
    :shoe_size => 17,
    :jersey_number => 11,
    :stats =>
      {:number => 11,
       :shoe => 17,
       :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15}},
  {:name => "Mason Plumlee",
    :shoe_size => 19,
    :jersey_number => 1,
    :stats =>
      {:number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 12,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5 }},
  {:name => "Jason Terry",
    :shoe_size => 31,
    :jersey_number => 15,
    :stats =>
      {:number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1 }}]
        },

:away => 
          {:team_name => "Charlotte Hornets", :colors => ["Turquoise", "Purple"], :players => 
            [{:name => "Jeff Adrien",
              :shoe_size => 18,
              :jersey_number => 4,
              :stats =>
                                {:number => 4,
                                  :shoe => 18,
                                  :points => 10,
                                  :rebounds => 1,
                                  :assists => 1,
                                  :steals => 2,
                                  :blocks => 7,
                                  :slam_dunks => 2}},
                {:name => "Bismak Biyombo",
                  :shoe_size => 18,
                  :jersey_number => 4,
                  :stats =>
                                {:number => 0,
                                  :shoe => 16,
                                  :points => 12,
                                  :rebounds => 4,
                                  :assists => 7,
                                  :steals => 7,
                                  :blocks => 15,
                                  :slam_dunks => 10}},
                {:name => "DeSagna Diop",
                  :shoe_size => 18,
                  :jersey_number => 4,
                  :stats =>
                                {:number => 2,
                                  :shoe => 14,
                                  :points => 24,
                                  :rebounds => 12,
                                  :assists => 12,
                                  :steals => 4,
                                  :blocks => 5,
                                  :slam_dunks => 5}},
                 {:name => "Ben Gordon",
                   :shoe_size => 18,
                    :jersey_number => 4,
                     :stats =>
                                {:number => 8,
                                  :shoe => 15,
                                  :points => 33,
                                  :rebounds => 3,
                                  :assists => 2,
                                  :steals => 1,
                                  :blocks => 1,
                                  :slam_dunks => 0}},
                   {:name => "Brendan Haywood",
                    :shoe_size => 18,
                    :jersey_number => 4,
                     :stats =>
                                {:number => 33,
                                  :shoe => 15,
                                  :points => 6,
                                  :rebounds => 12,
                                  :assists => 12,
                                  :steals => 22,
                                  :blocks => 5,
                                  :slam_dunks => 12}}]
                  }
}

    end

  def num_points_scored(player)
    $hash.each do |awayHome, value|
      $hash[awayHome][:players].each do |playerzz|
        if playerzz[:name] == player
          return playerzz[:stats][:points]
        end
        
      end
    end
  end

  def shoe_size(player)
    $hash.each do |awayHome, value|
      $hash[awayHome][:players].each do |playerzz|
        if playerzz[:name] == player
          return playerzz[:stats][:shoe]
        end
      end
    end
  end

  def team_colors(team)
    $hash.each do |awayHome, value|
      $hash[awayHome].each do |teams, strings|
        if strings == team
          return $hash[awayHome][:colors]
        end
      end
    end
   end

   def team_names
    array = Array.new
    $hash.each do |awayHome, value|
      array.push($hash[awayHome][:team_name])
    end 
    return array
   end
  
  def player_numbers(ballteam)
    array = Array.new
      $hash.each do |awayHome, value|
        if $hash[awayHome][:team_name] == ballteam
          $hash[awayHome][:players].each do |playerzz|
            array.push(playerzz[:stats][:number])
          end
        end
      end 
    return array
   end

  def player_stats(player)
    $hash.each do |awayHome, value|
      $hash[awayHome][:players].each do |playerzz|
        if playerzz[:name] == player
          return playerzz[:stats]
        end
      end
    end
  end

  def big_shoe_rebounds
    max = 0
    $hash.each do |awayHome, value|
      $hash[awayHome][:players].each do |playerzz|
        if max < playerzz[:stats][:shoe]
          max = playerzz[:stats][:shoe]
        else
          return playerzz[:stats][:rebounds]
        end
      end
    end
  end


   # Write your code here!









