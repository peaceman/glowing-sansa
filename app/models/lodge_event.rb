class LodgeEvent < ActiveRecord::Base
  include IceCube

  belongs_to :lodge
  serialize :recurrence_rule, Hash

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
