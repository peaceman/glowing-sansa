class AddGeolocationToLodge < ActiveRecord::Migration
  def change
    add_column :lodges, :latitude, :float
    add_column :lodges, :longitude, :float
  end
end
