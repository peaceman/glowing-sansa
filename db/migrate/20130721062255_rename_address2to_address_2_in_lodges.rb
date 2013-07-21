class RenameAddress2toAddress2InLodges < ActiveRecord::Migration
  def change
    rename_column :lodges, :address2, :address_2
  end
end
