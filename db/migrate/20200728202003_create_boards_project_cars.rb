class CreateBoardsProjectCars < ActiveRecord::Migration[6.0]
  def change
    create_table :boards_project_cars do |t|
      t.belongs_to :board
      t.belongs_to :project_car
    end
  end
end
