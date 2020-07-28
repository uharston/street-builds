class CreateBoards < ActiveRecord::Migration[6.0]
  def change
    create_table :boards do |t|
      t.belongs_to :project_car
      t.belongs_to :user
      t.string :title

      t.timestamps
    end
  end
end
