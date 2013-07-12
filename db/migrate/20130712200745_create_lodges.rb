class CreateLodges < ActiveRecord::Migration
  def change
    create_table :lodges do |t|
      t.string :name
      t.text :description
      t.boolean :published

      t.timestamps
    end
  end
end
