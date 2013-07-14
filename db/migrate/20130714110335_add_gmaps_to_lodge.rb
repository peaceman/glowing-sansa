class AddGmapsToLodge < ActiveRecord::Migration
  def change
    add_column :lodges, :gmaps, :boolean
  end
end
