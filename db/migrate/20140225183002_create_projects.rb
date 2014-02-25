class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :description
      t.integer :goal
      t.string :startdate
      t.string :datetime
      t.datetime :enddate
      t.integer :user_id
      t.integer :reward_id

      t.timestamps
    end
  end
end
