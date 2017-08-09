class WelcomeController < ApplicationController

  def index
    @users_name = User.all.map(&:name)
    tasks_count = []
    @new_count = []
    @inprogress_count = []
    @completed_count = []
    @admin_approval_count = []
    status_new = Status.find_by_name('New').id rescue ''
    status_inprogress = Status.find_by_name('in progress').id rescue ''
    status_completed = Status.find_by_name('completed').id rescue ''
    status_admin_approval = Status.find_by_name('admin approval').id rescue ''
    User.all.each do |user|
      @new_count << Task.where(:assigned_to_id => user.id,status_id: status_new).count
      @inprogress_count << Task.where(:assigned_to_id => user.id,status_id: status_inprogress).count
      @completed_count << Task.where(:assigned_to_id => user.id,status_id: status_completed).count
      @admin_approval_count << Task.where(:assigned_to_id => user.id,status_id: status_admin_approval).count
    end
  end

end
