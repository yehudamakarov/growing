class User < ActiveRecord::Base
  validates_presence_of :username, :email
  has_secure_password
  has_many :tasks

  def slug
    self.username.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    User.all.find {|u| u.slug == slug}
  end

  def day(day_of_week)
    self.tasks.find_all {|t| t.day.downcase == day_of_week.downcase}
  end
end
