class CreateStories < ActiveRecord::Migration
  def self.up
    create_table :stories do |t|
      t.string :title
      t.text :description
      t.string :story_type
      t.string :current_state
      t.integer :requester_id
      t.integer :owner_id
      t.integer :estimate
      t.integer :project_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :stories
  end
end
