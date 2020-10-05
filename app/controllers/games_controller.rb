class GamesController < ApplicationController

     
   def index

    if session[:id] != nil
        @user = User.find(session[:id])    
        @basketball = Team.find(@user.basketball_team_id)
        @baseball = Team.find(@user.baseball_team_id)
        @soccer = Team.find(@user.soccer_team_id)
        @football = Team.find(@user.football_team_id)
    end 
    @date = DateTime.now.strftime('%Y-%m-%d')
    @games_today = Game.today
    @games = Game.all
    @games_tomorrow = Game.tomorrow

    end 
    
    def show
        #byebug
        @game = Game.find(params[:id])
    end

    def soccer
        @games = Team.soccer_games
    end 
    def football
        @games = Team.football_games
    end 
    def basketball
        @games = Team.basketball_games
    end 
    def baseball
        @games = Team.baseball_games
    end 

end