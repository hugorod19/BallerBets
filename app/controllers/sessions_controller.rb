class SessionsController < ApplicationController

    def login
        @user = User.new
    end 

    def create
        @user = User.find_by(email: user_params[:email])
        if @user && @user.authenticate(user_params[:password])
            session[:id] = @user.id
            session[:display_name] = @user.display_name
            redirect_to '/games'
        else 
            flash[:error] = "Incorrect Email or Password"
            redirect_to '/login'
        end
    end 

    def destroy
        session.clear
        redirect_to '/'
    end

    private

    def user_params
        params.require(:user).permit(:email, :password)
    end 
end 