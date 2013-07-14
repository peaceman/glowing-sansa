class AddAddressToLodge < ActiveRecord::Migration
  def change
    add_column :lodges, :street, :string
    add_column :lodges, :city, :string
    add_column :lodges, :country, :string
  end
end
