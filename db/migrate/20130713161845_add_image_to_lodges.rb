class AddImageToLodges < ActiveRecord::Migration
  def change
    add_column :lodges, :image, :string
  end
end
