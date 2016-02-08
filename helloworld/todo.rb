class Task
	attr_reader :content, :id, :created_at, :updated_at
	@@current_id = 1
	def initialize(content)
		@content = content
		@id = @@current_id
		@@current_id += 1
		@complete = false
		@created_at = Time.now
		@updated_at = nil
	end

	def complete?
		@complete == true 
	end

	def complete!
		@complete = true
	end

	def make_incomplete!
		@complete = false
	end	

	def update_content! content
		@updated_at = Time.now
		@content = content
	end
	def self.get_current_id
		@@current_id
	end
end

class TodoList
	attr_reader :tasks, :user
	def initialize(user)
		@tasks = []
		@user = user
	end

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


end








