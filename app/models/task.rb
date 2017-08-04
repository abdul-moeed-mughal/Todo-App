class Task < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :status
  belongs_to :author, :class_name => 'User', :foreign_key => 'author_id'
  belongs_to :assigned_to, :class_name => 'User', :foreign_key => 'assigned_to_id'

  validates :subject, :presence => true
  validates :status_id, :presence => true
end
