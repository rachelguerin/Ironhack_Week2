require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry' if development?
require_relative './lib/task.rb'
require_relative './lib/todo.rb'

todo_list = TodoList.new("Rachel")
todo_list.load

get '/tasks' do  
	@todo_list = todo_list.tasks
	erb(:task_index)
end

get '/new_task' do
	erb(:new_task)
end

post '/create_task' do
	todo_list.add_task(Task.new(params[:content]))
	todo_list.save
	redirect('/tasks')
end

post '/complete' do
	if params[:delete]
		todo_list.delete_task(params[:delete])
	else
		todo_list.find_task_by_id(params[:complete]).complete!
	end
	todo_list.save
	redirect('/tasks')
end
