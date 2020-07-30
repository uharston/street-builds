class Board < ApplicationRecord
    validates :title, presence: true 
    belongs_to :user
    has_many :pins 
    has_many :cars, through: :pins 
    accepts_nested_attributes_for :pins 
end

