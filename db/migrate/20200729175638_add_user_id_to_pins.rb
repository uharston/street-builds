class AddUserIdToPins < ActiveRecord::Migration[6.0]
  def change
    add_column :pins, :year, :integer 
  end
end
