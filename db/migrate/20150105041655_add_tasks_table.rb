class AddTasksTable < ActiveRecord::Migration
  	def change
  	  create_table :tasks do |t|
	      t.string :name
	      t.boolean :is_completed, {default: false}
	      t.datetime :due_at
	      t.datetime :completed_at

	      t.timestamps null: false
		end
	end
end