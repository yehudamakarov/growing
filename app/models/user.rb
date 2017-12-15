class User < ActiveRecord::Base
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates_presence_of :username, :email
  validates_uniqueness_of :username
  has_secure_password
  has_many :tasks

  def slug
    self.username.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    User.all.find {|u| u.slug == slug}
  end

  def day(day_of_week)
    day = Day.find_by(name: day_of_week.downcase)
    day.tasks.find_all {|t| t.user == self}
  end
end
