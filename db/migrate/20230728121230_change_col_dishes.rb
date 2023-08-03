class ChangeColDishes < ActiveRecord::Migration[7.0]
  def change
    rename_column :dishes, :email, :description
    change_column :dishes, :description, :text
  end
end
