class SessionsController < ApplicationController


    def omniauth 
        # binding.pry 
        # request.env['omniauth.auth']['uid']
        user = User.create_from_omniauth(auth)
        if user.valid? 
            session[:user_id] = user.id 
            redirect_to builds_path
        else 
            redirect_to root_path 
        end 
    end 

    def new 
       @user = User.new 
    end 

    def create 
      
        if user = User.find_by(username: params[:username]) 
            if user.authenticate(params[:password])
            session[:user_id] = user.id 
            redirect_to builds_path 
            end 
        else 
            redirect_to login_path 
        end 
    end 

    def destroy 
        session.delete :user_id 
        redirect_to root_path 
    end 

    private 

    def auth 
        request.env['omniauth.auth']
    end 
end
