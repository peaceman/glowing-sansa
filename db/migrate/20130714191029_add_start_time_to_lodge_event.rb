class AddStartTimeToLodgeEvent < ActiveRecord::Migration
  def change
    add_column :lodge_events, :start_time, :datetime
  end
end
