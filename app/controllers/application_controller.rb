class ApplicationController < ActionController::Base
    # before_action :check_user 
    helper_method :current_user, :check_user

    def check_user 
        redirect_to root_path unless logged_in?
    end 
    def logged_in? 
        !!current_user
    end 

    def current_user 
       user ||=  User.find_by(id: session[:user_id])
    end 

end
