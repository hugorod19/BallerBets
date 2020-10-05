class UsersController < ApplicationController
  before_action :authenticated?, only: [:show, :edit]

  
  #  def index
  #   # if session[:date].blank?
  #   #   @yesterday = DateTime.now.yesterday.strftime('%Y-%m-%d')
  #   #   @date = DateTime.now.strftime('%Y-%m-%d')
  #   #   @tomorrow = DateTime.now.tomorrow.strftime('%Y-%m-%d')
  #   # else 
  #   #   @date = session[:date]
  #   # end 
  #   @date = DateTime.now.strftime('%Y-%m-%d')
  #   @games_today = Game.today
  # end 

  def authenticated?
    if session[:id] != nil  
      @user = User.find(session[:id])
    else
      redirect_to '/login'
    end
  end

  def new
    @user = User.new
    @basketball = Team.basketball
    @baseball = Team.baseball
    @soccer = Team.soccer
    @football = Team.football

  end

  def create
    user = User.new(user_params)
    if user.save && params[:password] == params[:password_confirmation] && user.valid?
      session[:id] = user[:id]
      session[:display_name] = user[:display_name]
      redirect_to '/games'
    else
      flash[:error] = user.errors.full_messages 
      redirect_to new_user_path
    end 
  end

  def edit
    @user = User.find(session[:id])
    @basketball = Team.basketball
    @baseball = Team.baseball
    @soccer = Team.soccer
    @football = Team.football
    
  end

  def update
    @user = User.find(params[:id])
    if params[:password] == params[:password_confirmation] && params[:password] == @user.password
      @user.update(user_params)
      session[:display_name] = @user.display_name
      redirect_to '/games'
    else
      flash[:error] = "password does not match" 
      redirect_to edit_user_path(session[:id])
    end 
  end

  def destroy
    
  end



  def show
    @user = User.find_by(id: session[:id])
    @basketball = Team.find(@user.basketball_team_id)
    @baseball = Team.find(@user.baseball_team_id)
    @soccer = Team.find(@user.soccer_team_id)
    @football = Team.find(@user.football_team_id)
    # byebug
  end

  # def tomorrow
  #   session[:date] = DateTime.tomorrow
  #   redirect_to '/users'
  # end 

  # def yesterday
  #   session[:date] = DateTime.yesterday
  #   redirect_to '/users'
  # end 

  private 

  def user_params 
    params.require(:user).permit(:id, :email, :display_name, :password, :password_confirmation, :basketball_team_id, :football_team_id, :baseball_team_id, :soccer_team_id)
  end 

end 
