class Car < ApplicationRecord
    # has_and_belongs_to_many :boards 
    has_many :pins
    has_many :boards, through: :pins
    has_many :users, through: :boards 
    belongs_to :owner, class_name: "User"

    def year_make_model
        "#{self.year} #{self.make} #{self.model}"
    end 
end 