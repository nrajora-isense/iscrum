class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :name
      t.boolean :is_archived, :default => 0
      t.text :profile_content
      t.boolean :allow_attachments, :default => 1
      t.date :start_date
      t.string :time_zone
      t.integer :iteration_length, :default => 1, :size => 1
      t.string :point_scale, :default => "Linear"
      t.integer :initial_velocity, :default => 10
      t.string :velocity_scheme, :default => "PastItr1"
      t.integer :done_iterations, :size => 3

      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
