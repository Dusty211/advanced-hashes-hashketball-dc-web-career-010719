
require 'pry'

def game_hash
  {
    :home => {
      :team_name => "Brooklyn Nets",
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
      :team_name => "Charlotte Hornets",
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

def player_stats(player)
  game_hash.each do |location, team_data|
    return team_data[:players][player] if team_data[:players].keys.include? player
  end
end

def num_points_scored(player)
  player_stats(player)[:points]
end

def shoe_size(player)
  player_stats(player)[:shoe]
end

def team_colors(team)
  game_hash.each do |location, team_data|
    return team_data[:colors] if team_data[:team_name] == team
  end
end

def team_players(team)
  game_hash.each do |location, team_data|
    return team_data[:players].keys if team_data[:team_name] == team
  end
end

def team_names
  return_names = []
  game_hash.each {|location, team_data| return_names << team_data[:team_name]}
  return_names
end

def player_numbers(team)
  return_numbers = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team
      team_data[:players].values.each do |hash|
        return_numbers << hash[:number]
      end
    end
  end
  return_numbers
end

def player_array
  return_players = []
  game_hash.each do |location, team_data|
    return_players << team_data[:players].keys
  end
  return_players.flatten
end

def big_shoe_rebounds
  #biggest_foot = 0
  #shoe_sizes = []
  #player_array.each do |player|
  #  shoe_sizes << player_stats(player)[:shoe]
  #end
  #biggest_foot = shoe_sizes.max
  binding.pry
  game_hash.values.each do |key, value|
    binding.pry
  end
  player_array.each do |player|
    binding.pry
    return player_stats(player)[:rebounds] if biggest_foot == player_stats(player)[:shoe]
  end
end

def most_points_scored
  high_score_array = []
  player_array.each do |player|
    high_score_array << num_points_scored(player)
  end
  player_array.each do |player|
    return player if high_score_array.max == num_points_scored(player)
  end
end

def winning_team
  scoreboard = {}
  team_names.each do |team|
    score = 0
    team_players(team).each do |player|
      score += num_points_scored(player)
    end
    scoreboard[team] = score
  end
  scoreboard.each do |team, score|
    return team if score == scoreboard.values.max
  end
end

def player_with_longest_name
  length_array = []
  player_array.each do |player|
    length_array << player.length
  end
  player_array.each do |player|
    return player if length_array.max == player.length
  end
end

def long_name_steals_a_ton?
  steals_hash = {}
  player_array.each do |player|
    steals_hash[player] = player_stats(player)[:steals]
  end
  return true if steals_hash[player_with_longest_name] == steals_hash.values.max
end




