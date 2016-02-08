class Todo
	attr_reader :content, :id
	@@current_id = 1
	def initialize(content)
		@content = content
		@id = @@current_id
		@@current_id += 1
		@complete = false
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

end