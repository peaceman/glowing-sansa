class CreateLodgeEventCategories < ActiveRecord::Migration
  def change
    create_table :lodge_event_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
