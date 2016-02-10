require './todo.rb'
require './task.rb'

describe "Tasks" do
	before :each do
		@task = Task.new("Walk the dog")
	end
	
	it "Todo item returns content \'walk the dog\'" do
		expect(@task.content).to eq("Walk the dog")
	end

	it "Todo item returns id" do
		expect(@task.id).to be > 0
	end

	it "Each item has a different id number" do
		expect(Task.new("Pick up shopping").id).not_to eq(@task.id)
	end

	it "Item is not complete by default" do
		expect(@task.complete?).to eq(false)
	end

	it "Item is complete" do
		@task.complete!
		expect(@task.complete?).to be(true)
	end

	it "complete? is false" do
		expect(@task.complete?).to be(false)
	end
	it "complete? is true" do
		@task.complete!
		expect(@task.complete?).to be(true)
	end

	it "complete! sets to true" do
		expect(@task.complete!).to be(true)
	end
	it "make_incomplete! sets to false" do
		@task.complete!
		@task.make_incomplete!
		expect(@task.complete?).to be(false)
	end

	it "check task time" do
		expect(@task.created_at.asctime).to eq(Time.now.asctime)
	end

	it "check task content is updated" do
		t1 = Task.new("Walk the milk")
		t2 = Task.new("Buy the dog")
		t1.update_content!("Walk the dog")
		t2.update_content!("Buy the milk")
		expect(t1.content).to eq("Walk the dog")
		expect(t2.content).to eq("Buy the milk")

	end

	it "checks non-updated task update_at is nil" do
		expect(@task.updated_at).to eq(nil)
	end

	it "tracks last updated time for task" do
		@task.update_content!("Walk the croc")
		expect(@task.updated_at.asctime).to eq(Time.now.asctime)
	end
end


describe "Task to do list" do
	before :each do
		@task = Task.new("Walk the dog")
		@todoList = TodoList.new("Rachel")
	end

	it "creates todo list, returns an array" do
		expect(@todoList.tasks).to be_an(Array)
	end

	it "adds a task to the list" do
		@todoList.add_task(@task)
		expect(@todoList.tasks[-1]).to eq(@task)
	end

	it "deletes a task by its ID" do
		@todoList.add_task(@task)
		@todoList.delete_task(@task.id)
		expect(@todoList.tasks.include?(@task)).not_to eq(true)
	end

	it "finds a task via its ID" do
		t1 = Task.new("Walk the milk")
		t2 = Task.new("Buy the dog")
		@todoList.add_task(t1)
		@todoList.add_task(t2)
		expect(@todoList.find_task_by_id(t1.id)).to eq(t1)
	end

	it "returns nil if a task is not found" do
		expect(@todoList.find_task_by_id(10)).to eq(nil)
	end

	it "sorts by created_at" do
		t1 = Task.new("Walk the milk")
		t2 = Task.new("Buy the dog")
		@todoList.add_task(t1)
		@todoList.add_task(t2)
		expect(@todoList.sort_by_created).to eq([t1,t2])
	end

	it "sorts by created_at in asc order" do
		t1 = Task.new("Walk the milk")
		t2 = Task.new("Buy the dog")
		@todoList.add_task(t1)
		@todoList.add_task(t2)
		expect(@todoList.sort_by_created("ASC")).to eq([t1,t2])
	end

	it "sorts by created_at in desc order" do
		t1 = Task.new("Walk the milk")
		t2 = Task.new("Buy the dog")
		@todoList.add_task(t1)
		@todoList.add_task(t2)
		expect(@todoList.sort_by_created("DESC")).to eq([t2,t1])
	
	end

	it "sets a user to the todo list" do
		expect(@todoList.user).to eq("Rachel")
	end

	# it "saves the todo list to YAML file" do
	# 	# expect(@todoList.save).to 
	# end
end