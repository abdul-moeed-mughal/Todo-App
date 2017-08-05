class ChangeDateToStringInTasks < ActiveRecord::Migration
  def change
    change_column :tasks, :start_date, :string
    change_column :tasks, :end_date, :string
    change_column :users, :dob, :string
  end
end
