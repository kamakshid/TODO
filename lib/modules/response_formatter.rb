module ResponseFormatter

	def formatted_tasks(tasks)
		if tasks.blank?
			return {message: "No Tasks."}
		end

		return tasks.map{ |task| task.attributes.slice("id", "created_at", "updated_at", "completed_at", "due_at", "name", "is_completed") }
	end

	def formatted_task(task)
		return task.attributes.slice("id", "created_at", "updated_at", "completed_at", "due_at", "name", "is_completed")
	end
end
