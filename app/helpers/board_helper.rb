module BoardHelper

    def board_title(user)
        if @user == current_user
            "My Boards"
        else 
            @user.first_name + "'s Boards"
        end
    end 
end
