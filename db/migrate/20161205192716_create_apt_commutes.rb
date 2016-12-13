class CreateAptCommutes < ActiveRecord::Migration[5.0]
  def change
    create_table :apt_commutes do |t|
      t.integer :apartment_id
      t.string :duration
    end
  end
end
