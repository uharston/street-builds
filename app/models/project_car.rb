class ProjectCar < ApplicationRecord
    # has_many :boards 
    # has_many :users, through: :boards 
    has_many :project_cars_admired, foreign_key: :admired_project_car_id
    has_many :admirers, through: :project_cars_admired, source: :project_car_admirer
    belongs_to :owner, class_name: "User"
  
end 