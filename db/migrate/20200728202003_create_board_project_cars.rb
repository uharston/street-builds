class CreateBoardProjectCars < ActiveRecord::Migration[6.0]
  def change
    create_table :board_project_cars do |t|
      t.belongs_to :board
      t.belongs_to :project_car
    end
  end
end
