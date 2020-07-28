class Board < ApplicationRecord
    belongs_to :project_car_admirer, class_name: "User"
    has_and_belongs_to_many :admired_project_cars, class_name: "ProjectCar"
end
