class AddStreetNrToLodge < ActiveRecord::Migration
  def change
    add_column :lodges, :street_nr, :string
  end
end
