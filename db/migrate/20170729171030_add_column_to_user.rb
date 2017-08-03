class AddColumnToUser < ActiveRecord::Migration
  def change
    # add_column :users, :confirmed_at, :string
    add_column :users, :admin, :boolean
  end
end
