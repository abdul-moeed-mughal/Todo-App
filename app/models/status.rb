class Status < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :tasks
  validates :name, :presence => true

end
