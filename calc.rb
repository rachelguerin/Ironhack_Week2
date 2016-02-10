require 'rspec'

class StringCalculator
	def sum(str="0")
		str.split(/[\s,]/).reduce(0){|memo,num| memo+num.to_i}
	end

	# def sum(str="")
	# 	numbers = str.split(",")
	# 	result = 0
	# 	numbers.each {|n| result += n.to_i}
	# 	result
	# end

end

RSpec.describe "String calculator" do

	# before :each do
	# 	@calc = StringCalculator.new
	# end

	let(:calc) {StringCalculator.new}

	it "returns 0 for the empty string" do
		expect(calc.sum("")).to eq(0)
	end

	it "returns 3 for only that number" do
		expect(calc.sum("3")).to eq(3)
	end

	it "returns 3 for adding 2 and 1" do
		expect(calc.sum("1\n2")).to eq(3)
	end

	it "returns 6 for adding 2, 1 and 3" do
		expect(calc.sum("1\n2,3")).to eq(6)
	end

	it "returns 6 for adding 2, 1 \\n 3" do
		expect(calc.sum("1,2,3")).to eq(6)
	end

	it "returns 6 for adding 2, 1 \\n 3" do
		expect(calc.sum("1\n2\n3")).to eq(6)
	end
end

