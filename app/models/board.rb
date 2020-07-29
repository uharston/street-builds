class Board < ApplicationRecord
    belongs_to :user
    # has_and_belongs_to_many :cars
    has_many :pins 
    has_many :cars, through: :pins 
    accepts_nested_attributes_for :pins 
end

# User 
# Board 
# Car 
# Pins
