class CreateApartments < ActiveRecord::Migration[5.0]
  def change
    create_table :apartments do |t|
      t.integer :user_id
      t.string :address
    end
  end
end
