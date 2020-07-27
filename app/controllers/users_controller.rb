class UsersController < ApplicationController
    
    def new 
        @user = User.new 
    end 

    def create 
        user = User.create(user_params)
        if user.valid? 
            redirect_to builds_path 
        else 
            redirect_to root_path 
        end 
    end 

    def show 

    end 

    private 

    def user_params 
        params.require(:user).permit(:username, :email, :password, :admin)
    end 
end
