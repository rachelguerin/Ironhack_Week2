require './todo.rb'

describe "Todo list" do
	before :each do
		@todo = Todo.new("Walk the dog")
	end
	
	it "Todo item returns content \'walk the dog\'" do
		expect(@todo.content).to eq("Walk the dog")
	end

	it "Todo item returns id" do
		expect(@todo.id).to be > 0
	end

	it "Each item has a different id number" do
		expect(Todo.new("Pick up shopping").id).not_to eq(@todo.id)
	end

	it "Item is not complete by default" do
		expect(@todo.complete?).to eq(false)
	end

	it "Item is complete" do
		@todo.complete!
		expect(@todo.complete?).to be(true)
	end

	it "complete? is false" do
		expect(@todo.complete?).to be(false)
	end
	it "complete? is true" do
		@todo.complete!
		expect(@todo.complete?).to be(true)
	end

	it "complete! sets to true" do
		expect(@todo.complete!).to be(true)
	end
	it "see task moving from false to true" do
		expect(@todo.complete?).to be(false)
		@todo.complete!
		expect(@todo.complete?).to be(true)
	end
	it "make_incomplete! sets to false" do
		@todo.complete!
		@todo.make_incomplete!
		expect(@todo.complete?).to be(false)
	end

end