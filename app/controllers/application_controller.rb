class ApplicationController < ActionController::Base
    helper_method :current_user, :check_user

    def check_user 
        redirect_to root_path unless logged_in?
    end 

    def authorized_user 
        redirect_to cars_path unless @user == current_use
    end 

    def logged_in? 
        !!current_user
    end 

    def current_user 
       user ||=  User.find_by(id: session[:user_id])
    end 

end
