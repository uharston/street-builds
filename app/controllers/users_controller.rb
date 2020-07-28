class UsersController < ApplicationController
    before_action :check_user
    
    def new 
        @user = User.new 
    end 

    def create 
        user = User.create(user_params)
        if user.valid? 
            redirect_to project_carss_path 
        else 
            redirect_to root_path 
        end 
    end 

    def show 
        locate_user
    end 

    private 
    
    def locate_user 
        @user = User.find(params[:id])
    end 

    def user_params 
        params.require(:user).permit(:username, :email, :password, :admin)
    end 
end
