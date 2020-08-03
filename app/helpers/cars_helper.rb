module CarsHelper 
    def edit_or_save(user)
        if current_user == user.owner 
             link_to "Edit Your Build", edit_car_path(user), class: "w3-large w3-button w3-red w3-round-large w3-left"  
        else 
             link_to "Save This Ride", new_car_pin_path(user), class: "w3-large w3-button w3-green w3-round-large w3-left"
        end 
    end


    # display_flash_error(symbol)
   
    #     if  flash[:errors][symbol]
    #         "Year #{flash[:errors][symbol].first}"
    #     else 
    #         "Year"
    #     end
    # end
end