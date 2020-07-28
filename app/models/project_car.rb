class ProjectCar < ApplicationRecord
    has_and_belongs_to_many :boards 
    has_many :boards, foreign_key: :admired_project_car_id
    has_many :admirers, through: :boards, source: :project_car_admirer
    belongs_to :owner, class_name: "User"

    def year_make_model
        "#{self.year} #{self.make} #{self.model}"
    end 
end 