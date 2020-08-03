class Pin < ApplicationRecord
    belongs_to :board 
    belongs_to :car
    accepts_nested_attributes_for :board
    validates :note, length: { maximum: 40 }
end
