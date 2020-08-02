module ApplicationHelper

    def display_navigation_bar
        if current_user 
            ((link_to "HOME", cars_path, class: "w3-bar-item w3-button w3-padding-large") +
            (link_to "PROFILE", user_path(current_user), class: "w3-bar-item w3-button w3-padding-large w3-hide-small") +
            (link_to "NEW BUILD", new_car_path, class: "w3-bar-item w3-button w3-padding-large w3-hide-small") +
            (link_to "BOARDS", user_boards_path(current_user), class: "w3-bar-item w3-button w3-padding-large w3-hide-small") +
            (link_to "LOGOUT", logout_path, method: :post, class: "w3-bar-item w3-button w3-padding-large w3-hide-small w3-left"))
            # content_tag 'div', class:"w3-dropdown-hover w3-hide-small" do 
            #     concat(content_tag :button, "Profile ", class: "w3-padding-large w3-button w3-right") 
                # # image_tag(current_user.image_href, class: "w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity" )
                # concat(content_tag :div, class: "w3-dropdown-content w3-bar-block w3-card-4") do 
                #     concat(link_to "My Cars", user_cars_path(current_user), class: "w3-bar-item w3-button") 
                #     concat(link_to "My Boards", user_boards_path(current_user), class: "w3-bar-item w3-button") 
                #     concat(link_to "Settings", user_cars_path(current_user), class: "w3-bar-item w3-button") 
                #     concat(link_to "Log Out", logout_path, class: "w3-bar-item w3-button")
                # end
            # end )
        else
            link_to "HOME", cars_path, class: "w3-bar-item w3-button w3-padding-large"
        end 
    end
    


    def avatar_dropdown 
        content_tag 'div', class:"w3-dropdown-hover w3-hide-small" do 
            concat(content_tag 'button', class: "w3-padding-large w3-button") do 
                concat( image_tag(current_user.image_href, class: "w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity" ))
            end 
            concat(content_tag :div, class: "w3-dropdown-content w3-bar-block w3-card-4") do 
                concat(link_to "My Cars", user_cars_path(current_user), class: "w3-bar-item w3-button") 
                concat(link_to "My Boards", user_boards_path(current_user), class: "w3-bar-item w3-button") 
                concat(link_to "Settings", user_cars_path(current_user), class: "w3-bar-item w3-button") 
                concat(link_to "Log Out", logout_path, class: "w3-bar-item w3-button")
            end
        end

    end
        
    
end 


# content_tag(:div, content_tag(:p, "Hello world!"), class:"w3-dropdown-hover w3-hide-small")

# <div class="w3-dropdown-hover w3-hide-small">
#     <button class="w3-padding-large w3-button"><img src="current_user.image_href>" style="width:65px;" class="w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity"></button>     
#     <div class="w3-dropdown-content w3-bar-block w3-card-4">
#          link_to "My Cars", user_cars_path(current_user), class: "w3-bar-item w3-button" 
#          link_to "My Boards", user_boards_path(current_user), class: "w3-bar-item w3-button"
#          link_to "Settings", user_cars_path(current_user), class: "w3-bar-item w3-button" 
#          link_to "Log Out", logout_path, class: "w3-bar-item w3-button" 
#     </div>
# </div>