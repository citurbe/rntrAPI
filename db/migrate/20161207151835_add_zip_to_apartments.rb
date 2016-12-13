class AddZipToApartments < ActiveRecord::Migration[5.0]
  def change
    add_column :apartments, :zip, :string
  end
end
