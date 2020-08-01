module ApplicationHelper
#content_tag(:div, content_tag(:p, "Hello world!"), class: "strong")
    def display_navigation_bar 
       if current_user 
            ((link_to "HOME", cars_path, class: "w3-bar-item w3-button w3-padding-large") +
            (link_to "PROFILE", user_path(current_user), class: "w3-bar-item w3-button w3-padding-large w3-hide-small") +
            (link_to "NEW BUILD", new_car_path, class: "w3-bar-item w3-button w3-padding-large w3-hide-small") +
            (link_to "BOARDS", user_boards_path(current_user), class: "w3-bar-item w3-button w3-padding-large w3-hide-small") +
            (link_to "LOGOUT", logout_path, method: :post, class: "w3-bar-item w3-button w3-padding-large w3-hide-small w3-right"))
          #  button_for ""
           # <a href="#"><img src="/w3images/avatar_g2.jpg" style="width:65px;" class="w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity"></a> 
        else
            link_to "HOME", cars_path, class: "w3-bar-item w3-button w3-padding-large"
        end 
    end 
end
