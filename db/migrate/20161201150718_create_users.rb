class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.text :email
      t.text :password_digest
      t.integer :commute
      t.integer :ammenities
      t.integer :education
      t.integer :safety

      t.timestamps
    end
  end
end
