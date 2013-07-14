class RenameScheduleOnLodgeEvent < ActiveRecord::Migration
  def change
    rename_column :lodge_events, :schedule, :recurrence_rule
  end
end
