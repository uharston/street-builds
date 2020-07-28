class ProjectCars < ActiveRecord::Migration[6.0]
  def change
    create_table :project_cars do |t| 
      t.integer :year 
      t.string :make 
      t.string :model 
      t.string :engine 
      t.string :drivetrain 
      t.string :suspension 
      t.string :wheels_and_tires 
    end 
  end
end
