class Pin < ApplicationRecord
    belongs_to :board 
    belongs_to :car
end
