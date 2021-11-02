class Item
  def self.valid_date?(date_str)
    parts = date_str.split('-')
    return false if parts.length != 3

    _, month, day = parts
    (month.to_i >= 1 && month.to_i <= 12) && (day.to_i >= 1 && day.to_i <= 31)
  end

  attr_reader :deadline
  attr_accessor :title, :description
  def initialize(title, deadline, description)
    @title = title
    @description = description
    raise 'error due to invalid date' if !Item.valid_date?(deadline)

    @deadline = deadline
  end

  def deadline=(new_deadline)
    raise 'error due to invalid date' if !Item.valid_date?(deadline)

    @deadline = new_deadline
  end


end