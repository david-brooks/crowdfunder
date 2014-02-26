class RenameColumnsOnRewards < ActiveRecord::Migration
  def change
  	rename_column :rewards, :breakpoints, :amount
  	rename_column :rewards, :prizes, :description
  end
end
