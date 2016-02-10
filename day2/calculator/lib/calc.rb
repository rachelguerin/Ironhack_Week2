class Calculator
	def initialize(user)
		@memory_file = "./public/#{user}_calc_memory.txt" 
		file = File.open(@memory_file,"w")
		file.close
	end

	def add(n,m)
		n + m
	end

	def sub(n,m)
		n - m
	end

	def mult(n,m)
		n * m
	end

	def div(n,m)
		n / m
	end

	def save(value)
		file = File.open(@memory_file,"w")
		file.puts(value)
		file.close
	end

	def retrieve
		file = File.open(@memory_file,"r")
		value = file.read
		file.close
		value.to_f
	end

	def reset
		file = File.open(@memory_file,"w")
		file.close
	end

end