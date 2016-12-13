class CreateAptCrimes < ActiveRecord::Migration[5.0]
  def change
    create_table :apt_crimes do |t|
      t.integer :apartment_id
      t.integer :felonies
      t.integer :misdemeanors
      t.integer :violations
    end
  end
end
