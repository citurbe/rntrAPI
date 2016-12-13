class CreateDestinations < ActiveRecord::Migration[5.0]
  def change
    create_table :destinations do |t|
      t.integer :user_id
      t.text :name
      t.text :address

      t.timestamps
    end
  end
end
