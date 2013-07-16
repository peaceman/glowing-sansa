class AddRegistrationNumberToLodge < ActiveRecord::Migration
  def change
    add_column :lodges, :registration_number, :integer
    add_index :lodges, :registration_number, :unique => true
  end
end
