class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
	t.column :name, :string
	t.column :description, :string
	t.column :difficulty, :string
	t.column :user_id, :integer
	t.column :project_id, :integer
	t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
