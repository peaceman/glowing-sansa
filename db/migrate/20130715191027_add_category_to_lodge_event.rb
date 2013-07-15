class AddCategoryToLodgeEvent < ActiveRecord::Migration
  def change
    add_reference :lodge_events, :lodge_event_category, index: true
  end
end
