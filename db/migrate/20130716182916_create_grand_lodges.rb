class CreateGrandLodges < ActiveRecord::Migration
  def change
    create_table :grand_lodges do |t|
      t.string :name

      t.timestamps
    end
  end
end
