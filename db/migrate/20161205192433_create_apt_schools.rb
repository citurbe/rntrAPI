class CreateAptSchools < ActiveRecord::Migration[5.0]
  def change
    create_table :apt_schools do |t|
      t.integer :apartment_id
      t.integer :a_schools
      t.integer :b_schools
      t.integer :c_schools
      t.integer :d_schools
      t.integer :f_schools
    end
  end
end
