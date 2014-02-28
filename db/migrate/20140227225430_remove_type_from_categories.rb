class RemoveTypeFromCategories < ActiveRecord::Migration
  def change
  	remove_column :categories, :type, :string
  	add_column :categories, :category_name, :string
  end
end
