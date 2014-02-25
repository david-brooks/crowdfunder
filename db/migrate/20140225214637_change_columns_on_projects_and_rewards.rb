class ChangeColumnsOnProjectsAndRewards < ActiveRecord::Migration
  def change
  	remove_column :projects, :reward_id, :integer
  	add_column :rewards, :project_id, :integer
  end
end
