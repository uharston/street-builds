module UsersHelper

    
    def omniauth_user?(user)
        link_to "Settings", edit_user_path(user), class: "w3-bar-item w3-button" if !user.uid.present?
    end

    def display_avatar(user)
        if user.avatar.attached?
            image_tag(user.avatar, style:"width:50px;", class: "w3-circle  w3-hover-opacity")
        elsif user.image_href 
            image_tag(user.image_href, style:"width:50px;", class: "w3-circle  w3-hover-opacity")
        else
            image_tag("https://happytravel.viajes/wp-content/uploads/2020/04/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png",  style:"width:50px;", class: "w3-circle  w3-hover-opacity")
        end
    end 

    def garage_title(user)
        if @user == current_user
            "My Garage"
        else 
            @user.first_name + "'s Garage"
        end
    end 

    
    def edit_or_save(user)
         if current_user == user.owner 
            link_to "Edit Your Build", edit_car_path(user), class: "green-outline"          
        else 
            link_to "Save This Ride", new_car_pin_path(user), class: "green-outline"
        end 
    end

end
