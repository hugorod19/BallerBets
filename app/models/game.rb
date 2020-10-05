class Game < ApplicationRecord
    has_many :bets
    #has_and_belongs_to_many :teams
    belongs_to :home_team, class_name: 'Team', required: true
    belongs_to :away_team, class_name: 'Team', required: true
    #belongs_to :sport, through: :home_team

    def self.today 
        today = DateTime.now.strftime('%Y-%m-%d')
        Game.all.where(date: today)
    end 

    def self.yesterday 
        yesterday = DateTime.yesterday.strftime('%Y-%m-%d')
        Game.all.where(date: yesterday)
    end 

    def self.yesterday2
        yesterday = DateTime.yesterday.yesterday.strftime('%Y-%m-%d')
        Game.all.where(date: yesterday)
    end 

    def self.tomorrow 
        tomorrow = DateTime.tomorrow.strftime('%Y-%m-%d')
        Game.all.where(date: tomorrow)
    end

    def self.tomorrow2 
        tomorrow = DateTime.tomorrow.tomorrow.strftime('%Y-%m-%d')
        Game.all.where(date: tomorrow)
    end

    def result
        if home_score == nil
            "This team does not have a recent game"
        elsif home_score > away_score 
            "#{home_team.team_name} Beat the #{away_team.team_name}, #{self.home_score} to #{self.away_score}"
        else
            "#{away_team.team_name} Beat the #{home_team.team_name}, #{self.away_score} to #{self.home_score}" 
        end 
    end 





    # def self.any_day(m,d,y)
    #     today = DateTime.now.strftime('y-m-d')
    #     Game.all.where(date: today)
    # end 
end
