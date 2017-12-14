class Task < ActiveRecord::Base
  belongs_to :user

  def slug
    self.username.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    Task.all.find {|u| u.slug == slug}
  end
end
