class Task
	attr_accessor :content, :id, :complete, :created_at, :updated_at
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