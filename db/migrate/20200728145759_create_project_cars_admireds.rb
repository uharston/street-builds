class CreateProjectCarsAdmireds < ActiveRecord::Migration[6.0]
  def change
    create_table :project_cars_admireds do |t|
      t.integer :admired_project_car_id 
      t.integer :project_car_admirer_id 
      t.string :title

      t.timestamps
    end
  end
end
