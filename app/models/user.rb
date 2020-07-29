class User < ApplicationRecord
    has_secure_password 
    has_many :boards#, foreign_key: :admirer_id#:project_car_admirer_id
    # has_many :admired_project_cars, through: :boards #<-
    has_many :owned_project_cars, foreign_key: "owner_id", class_name: "ProjectCar"
    # user <-> project_car not working

    def self.create_from_omniauth(auth) 
        User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u| 
            u.username = auth['info']['first_name']
            u.email = auth['info']['email']
            u.password = SecureRandom.hex(16)
        end 
    end 
end
