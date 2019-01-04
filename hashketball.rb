
def game_hash
{
:away => {
  :team_name => "Charlotte Hornets",
  :colors => ["Turquoise", "Purple"],
  :players => {

"Jeff Adrien" =>	 {
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

"Ben Gordon"	=> {
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
},

:home => {
  :team_name => "Brooklyn Nets",
  :colors => ["Black", "White"],
  :players => {

"Alan Anderson"	=> {
    :number => 0,
    :shoe => 16,
    :points => 22,
    :rebounds => 12,
    :assists => 12,
    :steals => 3,
    :blocks => 1,
    :slam_dunks => 1
},

"Reggie Evans"	=> {
    :number => 30,
    :shoe => 14,
    :points => 12,
    :rebounds => 12,
    :assists => 12,
    :steals => 12,
    :blocks => 12,
    :slam_dunks => 7
},

"Brook Lopez"	=> {
    :number => 11,
    :shoe => 17,
    :points => 17,
    :rebounds => 19,
    :assists => 10,
    :steals => 3,
    :blocks => 1,
    :slam_dunks => 15
},

"Mason Plumlee"	=> {
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
}
}
end

def player_array
  game_hash.collect {|home_away, team_stat| team_stat[:players].keys}.flatten
end

def player_stats(player)
  game_hash.each do |home_away, team_stat|
    return team_stat[:players][player] if team_stat[:players][player] != nil
  end
end

def num_points_scored(player)
  player_stats(player)[:points]
end

def shoe_size(player)
  player_stats(player)[:shoe]
end

def team_colors(team)
  game_hash.each do |home_away, team_stat|
    return team_stat[:colors] if team_stat[:team_name] == team
  end
end

def team_names
  game_hash.collect {|home_away, team_stat| team_stat[:team_name]}
end

def player_numbers(team)
  game_hash.each do |home_away, team_stat|
    if team_stat[:team_name] == team
      return team_stat[:players].values.collect do |player|
        player[:number]
      end
    end
  end
end

def big_shoe_rebounds
  player_stats(player_array.sort_by {|player| player_stats(player)[:shoe]}.last)[:rebounds]
end

def most_points_scored
  player_array.sort_by {|player| player_stats(player)[:points]}.last
end

def winning_team
  away_team = game_hash[:away][:team_name]
  home_team = game_hash[:home][:team_name]
  scoreboard = {away_team => 0, home_team => 0}
  game_hash.values.each do |team_stat|
    team_stat[:players].each do |name, stats|
      scoreboard[team_stat[:team_name]] += stats[:points]
    end
  end
  return away_team if scoreboard[away_team] > scoreboard[home_team]
  home_team
end

def player_with_longest_name
  player_array.sort_by {|player| player.length}.last
end

def long_name_steals_a_ton?
  player_array.sort_by {|player| player_stats(player)[:steals]}.last == player_with_longest_name
end
