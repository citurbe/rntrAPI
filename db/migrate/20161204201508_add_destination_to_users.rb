class AddDestinationToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :destination, :text
  end
end
