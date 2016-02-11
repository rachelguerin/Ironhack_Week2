require 'pry'
require 'Time'
require_relative './task.rb' 


class TodoList
	attr_reader :tasks, :user
	def initialize(user)
		@tasks = []
		@user = user
		@filename = user + "_tasks.txt"
	end

	def save
		file = File.open(@filename,"w")
		@tasks.each do |task|
			file.puts("#{task.id},#{task.content},#{task.complete},#{task.created_at},#{task.updated_at}")
		end
		file.close
	end

	def add_task(task)
		@tasks << task
	end

	def delete_task(id)
		@tasks.delete_if {|t| t.id == id}
	end

	def find_task_by_id(id)
		index = @tasks.find_index {|t| t.id == id}
		index ? @tasks[index] : nil
	end

	def sort_by_created(order="ASC")
		if order == "ASC"
			@tasks.sort { |t1,t2| t1.created_at <=> t2.created_at}
		elsif order == "DESC"
			@tasks.sort { |t1,t2| t2.created_at <=> t1.created_at}
		end
	end

	def load
		file = File.open(@filename,"r")
		tasks = file.read.split(/\n/)
		tasks.each do |t|
			taskArray = t.split(',')
			newTask = Task.new(taskArray[1])
			newTask.id = taskArray[0]
			newTask.complete = (taskArray[2] == 'true' ? true : false)
			newTask.created_at = Time.strptime(taskArray[3],"%F %H:%M:%S")		
			newTask.updated_at = Time.strptime(taskArray[4].to_s,"%F %H:%M:%S") if taskArray[4]
			@tasks << newTask
		end
		file.close
	end

end








