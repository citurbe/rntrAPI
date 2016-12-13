class CreateAptAmenities < ActiveRecord::Migration[5.0]
  def change
    create_table :apt_amenities do |t|
      t.integer :apartment_id
      t.integer :count
      t.string :name
    end
  end
end
