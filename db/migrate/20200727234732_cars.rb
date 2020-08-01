class Cars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t| 
      t.integer :year 
      t.string :make 
      t.string :model 
      t.string :engine 
      t.string :drivetrain 
      t.string :suspension_and_brakes
      t.string :wheels_and_tires 
      t.integer :owner_id 
    end 
  end
end
