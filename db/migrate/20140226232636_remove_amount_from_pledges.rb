class RemoveAmountFromPledges < ActiveRecord::Migration
  def change
  	remove_column :pledges, :amount, :integer
  end
end
