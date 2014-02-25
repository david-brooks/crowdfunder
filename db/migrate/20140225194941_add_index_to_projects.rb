class AddIndexToProjects < ActiveRecord::Migration
  def change
  	add_index :projects, :title
  end
end
