class Team < ApplicationRecord
    belongs_to :sport
    #has_many :games
    has_many :home_games, class_name: 'Game', foreign_key: :home_team_id
    has_many :away_games, class_name: 'Game', foreign_key: :away_team_id
    has_many :bets, through: :games
    has_many :users, through: :bets

    def games
        Game.where('home_team_id = ? or away_team_id = ?', id, id)
    end

    def self.soccer
        Team.all.select do |team|
            team.sport.sport_name == "Soccer"
        end 
    end

    def self.soccer_games 
        games = self.soccer.collect do |team|
            team.games 
        end 
        games = games.flatten.uniq
    end 

    def self.football_games 
        games = self.football.collect do |team|
            team.games 
        end 
        games = games.flatten.uniq
    end 

    def self.baseball_games 
        games = self.baseball.collect do |team|
            team.games 
        end 
        games = games.flatten.uniq
    end 

    def self.basketball_games 
        games = self.basketball.collect do |team|
            team.games 
        end 
        games = games.flatten.uniq
    end 

    def self.basketball
        Team.all.select do |team|
            team.sport.sport_name == "Basketball"
        end 
    end

    def self.football
        Team.all.select do |team|
            team.sport.sport_name == "Football"
        end 
    end

    def self.baseball
        Team.all.select do |team|
            team.sport.sport_name == "Baseball"
        end 
    end

end
