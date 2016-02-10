# require 'yaml/store'


class TodoList
	attr_reader :tasks, :user
	def initialize(user)
		# @todo_store = YAML::Store.new("./public/tasks.yml")
		@tasks = []
		@user = user
	end

	# def save
	# 	@todo_store.transaction do
	# 		@todo_store[@user] = @tasks
	# 	end
	# end

	def add_task(task)
		@tasks << task
	end

	def delete_task(id)
		@tasks.delete_if {|t| t.id == id}
	end

	def find_task_by_id(id)
		index = @tasks.find_index {|t| t.id.to_int == id}
		index ? @tasks[index] : nil
	end

	def sort_by_created(order="ASC")
		if order == "ASC"
			@tasks.sort { |t1,t2| t1.created_at <=> t2.created_at}
		elsif order == "DESC"
			@tasks.sort { |t1,t2| t2.created_at <=> t1.created_at}
		end
	end

	# def load_tasks

	# end
end








