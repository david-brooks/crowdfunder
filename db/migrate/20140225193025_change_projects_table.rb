class ChangeProjectsTable < ActiveRecord::Migration
  def change
  	remove_column :projects, :startdate
  	remove_column :projects, :datetime
  	remove_column :projects, :enddate
  	add_column :projects, :start_date, :datetime
  	add_column :projects, :end_date, :datetime
  end
end
