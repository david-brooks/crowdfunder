class RemoveCategoryFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :category, :string
  end
end
