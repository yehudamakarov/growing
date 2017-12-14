class Task < ActiveRecord::Base
  validates_presence_of :user, :name
  belongs_to :user
  has_many :day_tasks
  has_many :days, through: :day_tasks

  def slug
    self.username.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    Task.all.find {|u| u.slug == slug}
  end

  def which_days?
    self.days.map {|d| d.name.capitalize}.join(", ")
  end
end
