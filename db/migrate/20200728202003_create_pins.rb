class CreatePins < ActiveRecord::Migration[6.0]
  def change
    create_table :pins do |t|
      t.belongs_to :board
      t.belongs_to :car
      t.string :note 
      t.timestamps
    end
  end
end
