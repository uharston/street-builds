class User < ApplicationRecord
    has_secure_password 
    validates :first_name, presence: true 
    validates :last_name, presence: true 
    validates :email, presence: true 
    validates :email, uniqueness: true
    has_many :boards
    has_many :cars, through: :boards 
    has_many :pins, through: :boards 
    has_many :owned_cars, foreign_key: "owner_id", class_name: "Car"
    has_one_attached :avatar 

    
    

    def self.create_from_omniauth(auth) 
         
        User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u| 
            u.first_name = auth['info']['first_name']
            u.last_name = auth['info']['last_name']
            u.email = auth['info']['email']
            u.image_href = auth['info']['image']
            # u.avatar.attach(auth['info']['image'])
            u.password = SecureRandom.hex(16)
        end 
       
    end 
end
