class AddColumnsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :category_1, :text
    add_column :users, :category_2, :text
    add_column :users, :category_3, :text
  end
end
