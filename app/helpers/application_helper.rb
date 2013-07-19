module ApplicationHelper
  def value_or_default(value, default = '-')
    return default if value.blank?
    return default if value == link_to('', '')

    value
  end
end
