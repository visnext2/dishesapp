class AddChefIdDishes < ActiveRecord::Migration[7.0]
  def change
    add_column :dishes, :chef_id, :integer
  end
end
