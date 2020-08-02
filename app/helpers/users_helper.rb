module UsersHelper

    def display_avatar(user)
        if user.avatar.attached?
            image_tag(user.avatar, style:"width:50px;", class: "w3-circle  w3-hover-opacity")
        elsif user.image_href 
            image_tag(user.image_href, style:"width:50px;", class: "w3-circle  w3-hover-opacity")
        else
            image_tag("https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png",  style:"width:50px;", class: "w3-circle  w3-hover-opacity")
        end
    end 
end
