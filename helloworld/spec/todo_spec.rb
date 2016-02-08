require './todo.rb'

describe "Todo task list" do
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

	it "check if the last task added has current ID " do
		expect(@task.id).to eq(Task.get_current_id-1)
	end

	it "checks non-updated task update_at is nil" do
		expect(@task.updated_at).to eq(nil)
	end

	it "task tracks last updated time" do
		@task.update_content!("Walk the croc")
		expect(@task.updated_at.asctime).to eq(Time.now.asctime)
	end
end