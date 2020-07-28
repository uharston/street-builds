class Board < ApplicationRecord
    belongs_to :project_car_admirer, class_name: "User"
    # belongs_to :admired_project_car, class_name: "ProjectCar"
    has_and_belongs_to_many :admired_project_cars, class_name: "ProjectCar"
end
