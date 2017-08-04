class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :subject
      t.text :description
      t.datetime :start_date
      t.datetime :end_date
      t.integer :status_id
      t.integer :assigned_to_id
      t.integer :author_id
      t.timestamps
    end
  end
end
