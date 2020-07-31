class UsersController < ApplicationController
    
    def new 
        @user = User.new 
    end 

    def create 
        user = User.create(user_params)
        if user.valid? 
            session[:user_id] = user.id 
            redirect_to cars_path 
        else 
            flash[:error] = user.errors.messages
            redirect_to signup_path 
        end 
    end 

    def show 
        check_user
        locate_user
    end 

    private 
    
    def locate_user 
        @user = User.find(params[:id])
    end 

    def user_params 
        params.require(:user).permit(:username, :email, :password, :admin, :avatar)
    end 
end
