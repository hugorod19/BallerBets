class Bet < ApplicationRecord
    belongs_to :user
    belongs_to :game

    validates(:amount, {presence: true})
    validates(:team_id, {presence: true})

    def list 
        team = Team.find(self.team_id)
        game = Game.find(self.game_id)
        away_team = Team.find(game.away_team.id)
        home_team = Team.find(game.home_team.id)
        if team == away_team
            other_team = home_team
        else 
            other_team = away_team
        end 
        "You have $#{self.amount} on #{team.team_name} to beat the #{other_team.team_name}"
    end 

    
end
