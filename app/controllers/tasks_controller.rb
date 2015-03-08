class TasksController < ApplicationController

	require "#{Rails.root}/lib/modules/response_formatter.rb"
	include ResponseFormatter

	def index

		if (params[:type] == 'active')
			tasks = Task.where(is_completed: false)
		elsif (params[:type] == 'completed')
			tasks = Task.where(is_completed: true)
		elsif (params[:type] == 'all')
			tasks = Task.all
		else
			render status: 400, json: {error: "Check request format."}
		end			
		
		tasks.sort_by! {|task| task.created_at }
		render status: 200, json: {tasks: formatted_tasks(tasks)}
	end

	def show
		task = Task.find(params[:task_id])

		if task
			render status: 200, json: {task: formatted_tasks(task)}
			return
		end

		render status: 400, json: {error: "Error showing task."}
	end

	def create
		task = Task.create(task_create_params)
		if task.errors.any?
			error = task.errors.full_messages.first
			render status: 400, json: {error: error}
			return
		end

		render status: 201, json: {message: "Task Created.", task: formatted_tasks(task)}
	end

	def update
		task = Task.find(params[:task_id])

		if task && task.update(task_update_params)
			render status: 200, json: {message: "Task Edited.", task: formatted_tasks(task)}
			return
		end

		render status: 400, json: {error: "Error editing task."}
	end

	def destroy
		task = Task.find(params[:task_id])

		if task && task.destroy
			render status: 200, json: {message: "Task Deleted."}
			return
		end
		
		render status: 400, json: {error: "Error deleting task."}
	end

	def toggle_completed
		task = Task.find(params[:task_id])

		if task && task.update(task_complete_params)
			if params[:is_completed] == "true"
				message = "Congrats!"
			else
				message = "Keep at it!"
			end

			render status: 200, json: {message: message, task: formatted_tasks(task)}
			return
		end

		render status: 400, json: {error: "Error updating task."}			
	end

	private

	def task_create_params
		params.permit(:name, :due_at)
	end

	def task_update_params
		params.permit(:name, :due_at)
	end

	def task_complete_params
		params.permit(:is_completed)
	end

end
