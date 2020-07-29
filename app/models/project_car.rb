class ProjectCar < ApplicationRecord
    has_and_belongs_to_many :boards 
    belongs_to :owner, class_name: "User"

    def year_make_model
        "#{self.year} #{self.make} #{self.model}"
    end 
end 