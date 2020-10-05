class TeamsController < ApplicationController

    def index
        @basketball = Team.basketball
        @baseball = Team.baseball
        @soccer = Team.soccer
        @football = Team.football
    end

    def show
        @team = Team.find(params[:id])
    end
    
end 
    
