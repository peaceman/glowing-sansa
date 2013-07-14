class CreateLodgeEvents < ActiveRecord::Migration
  def change
    create_table :lodge_events do |t|
      t.references :lodge, index: true
      t.string :name
      t.string :description
      t.string :schedule

      t.timestamps
    end
  end
end
