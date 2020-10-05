class BetsController < ApplicationController
    before_action :authenticated?
    
    def authenticated?
        if session[:id] != nil  
          @user = User.find(session[:id])
        else
          redirect_to '/login'
        end
    end

    def index
        @user = User.find(session[:id])
        #@bets = Bet.where(id: @user.id)
    end

    def show
        @bet = Bet.find
    end

    def new
        @game = Game.find(params[:game_id])
        session[:game_id] = @game.id
        @bet = Bet.new
        #byebug
        @teams = []
        @teams << @game.home_team 
        @teams << @game.away_team 
    end

    def create
        bet = Bet.new(amount: params[:bet][:amount], team_id: params[:bet][:team_id], user_id: session[:id], game_id: session[:game_id])
        team = Team.find(bet.team_id)
        if bet.valid?
            bet.save
            flash[:congrats] = "Congratulations! you have bet $#{bet.amount} on the #{team.team_name}"
            redirect_to game_path(session[:game_id])
          else
            flash[:message] = "Invalid amount or team selection"
            redirect_to new_bet_path(:game_id => session[:game_id])
        end 
    end


end