class UsersController < ApplicationController
    
    def new 
        @user = User.new 
    end 

    def create 
        @user = User.create(user_params)
        if @user.valid? 
            session[:user_id] = @user.id 
            redirect_to cars_path 
        else 
            flash[:error] = @user.errors.full_messages.to_sentence
            render 'users/new'
        end 
    end 

    def show 
        check_user
        locate_user
    end 

    def edit
        check_user 
        if current_user.uid.present?
            redirect_to cars_path
        else
            locate_user 
        end
    end 

    def update 
        locate_user.update(user_params)
        if @user.valid? 
            redirect_to cars_path
        else
            render 'user/edit'
            # redirect_to edit_user_path(current_user)
        end 
    end 

    private 
    
    def locate_user 
        @user = User.find(params[:id])
    end 

    def user_params 
        params.require(:user).permit(:first_name, :last_name,  :email, :password, :password_confirmation, :admin, :image_href, :avatar)
    end 
end
