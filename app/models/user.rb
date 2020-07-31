class User < ApplicationRecord
    has_secure_password 
    validates :username, presence: true 
    validates :email, presence: true 
    validates :email, uniqueness: true
    has_many :boards
    has_many :cars, through: :boards 
    has_many :pins, through: :boards 
    has_many :owned_cars, foreign_key: "owner_id", class_name: "Car"
    has_one_attached :avatar 

    
    

    def self.create_from_omniauth(auth) 
        User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u| 
            u.username = auth['info']['first_name']
            u.email = auth['info']['email']
            u.password = SecureRandom.hex(16)
        end 
    end 
end
