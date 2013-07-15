class LodgeEvent < ActiveRecord::Base
  include IceCube

  belongs_to :lodge
  belongs_to :lodge_event_category
  serialize :recurrence_rule, Hash

  validates :name, :description, :lodge_id, :lodge_event_category_id, :start_time, :presence => true

  def schedule
    s = Schedule.new(start_time)
    s.add_recurrence_rule RecurringSelect.dirty_hash_to_rule(recurrence_rule) unless recurrence_rule.nil?

    s
  end

  def next_events(amount)
    schedule.next_occurrences(amount).map do |o|
      OpenStruct.new({name: name, start_time: o})
    end
  end

  def recurrence_rule
    attr = read_attribute(:recurrence_rule)
    return attr unless attr.blank?

    nil
  end

  def recurrence_rule=(new_rule)
    if RecurringSelect.is_valid_rule?(new_rule)
      write_attribute(:recurrence_rule, RecurringSelect.dirty_hash_to_rule(new_rule).to_hash)
    else
      write_attribute(:recurrence_rule, nil)
    end
  end
end
