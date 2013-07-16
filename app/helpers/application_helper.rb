module ApplicationHelper
  def value_or_default(value, default = '-')
    value.blank? ? default : value
  end
end
