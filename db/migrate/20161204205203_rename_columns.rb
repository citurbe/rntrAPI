class RenameColumns < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :ammenities, :amenities
    rename_column :users, :education, :schools
  end
end
