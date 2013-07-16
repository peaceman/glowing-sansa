class UniqueIndexForLodgeName < ActiveRecord::Migration
  def change
    add_index :lodges, :name, :unique => true
  end
end
