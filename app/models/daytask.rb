class DayTask < ActiveRecord::Base
  belongs_to :day
  belongs_to :task
end
