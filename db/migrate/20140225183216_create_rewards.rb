class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.integer :breakpoints
      t.string :prizes

      t.timestamps
    end
  end
end
