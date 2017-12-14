class Day < ActiveRecord::Base
  has_many :day_tasks
  has_many :tasks, through: :day_tasks

  def self.sunday
    Day.find_by_id(1)
  end

  def self.monday
    Day.find_by_id(2)
  end

  def self.tuesday
    Day.find_by_id(3)
  end

  def self.wednesday
    Day.find_by_id(4)
  end

  def self.thursday
    Day.find_by_id(5)
  end

  def self.friday
    Day.find_by_id(6)
  end

  def self.saturday
    Day.find_by_id(7)
  end

end
