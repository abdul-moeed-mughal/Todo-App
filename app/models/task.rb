class Task < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :status
  belongs_to :author, :class_name => 'User', :foreign_key => 'author_id'
  belongs_to :assigned_to, :class_name => 'User', :foreign_key => 'assigned_to_id'

  validates :subject, :presence => true
  validates :status_id, :presence => true

  before_save :assigned_to_admin


  def assigned_to_admin
    if self.status.name.casecmp('completed') == 0
      status = Status.find_by_name('Admin approval').id rescue''
      assignee = User.find_by_name('admin').id rescue ''
      self.status_id = status
      self.assigned_to_id = assignee
      self.save
    end
  end

  def self.search(value)
    if value.present?
      # where('subject::string LIKE ? or description::text like ? or id::text like ?', "%#{value}%","%#{value}%","%#{value}%")
      where("subject::text LIKE '%#{value}%' or description::text LIKE '%#{value}%'")
    else
      scoped
    end
  end
end
