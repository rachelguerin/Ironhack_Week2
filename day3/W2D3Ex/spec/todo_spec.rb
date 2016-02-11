require_relative '../lib/todo.rb'


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

	it "saves a todo list with one item to CSV file" do
		@todoList.add_task(Task.new("Party on dude"))
		@todoList.save
		f = File.open("Rachel_tasks.txt","r")
		people = f.read.split(/\n/)
		f.close
		expect(people[0].split(',')[1]).to eq("Party on dude")
	end

	it "saves a todo list with multiple items to CSV file" do
		@todoList.add_task(Task.new("Party on dude"))
		@todoList.add_task(Task.new("Be excellent"))
		@todoList.save
		f = File.open("Rachel_tasks.txt","r")
		people = f.read.split(/\n/)
		f.close
		expect(people[1].split(',')[1]).to eq("Be excellent")
	end

	it "loads saved tasks to the todo list" do
		@todoList.add_task(Task.new("Party on dude"))
		@todoList.add_task(Task.new("Be excellent"))
		@todoList.save
		@todoList.load
		expect(@todoList.tasks[0].content).to eq("Party on dude")
	end
end