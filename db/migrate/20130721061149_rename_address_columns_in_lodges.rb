class RenameAddressColumnsInLodges < ActiveRecord::Migration
  def change
    rename_column :lodges, :street, :address
    rename_column :lodges, :street_nr, :address2
  end
end
