class ProjectCarsAdmired < ApplicationRecord
    belongs_to :project_car_admirer, class_name: "User"
    belongs_to :admired_project_car, class_name: "ProjectCar"
end
