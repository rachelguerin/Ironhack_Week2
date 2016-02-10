require './lexi.rb'

RSpec.describe "Lexiconomitron" do
	before :each do
		@lexi = Lexiconomitron.new
	end

  describe "#eat_t" do
    it "removes every letter t from the input" do
      
      expect(@lexi.eat_t("great scott!")).to eq("grea sco!")
    end
  end

  describe "#shazam" do
	# it "reverses each word" do
    # 	expect(@lexi.shazam([“This”, “is”, “a”, “boring”, “test”])).to eq(["sihT", "si","a","gnirob","tset"])
    # end

    # it "reverses each word" do
    # 	expect(@lexi.shazam([“This”, “is”, “a”, “boring”, “test”])).to eq(["sihT", "si","a","gnirob","tset"])
    # end

    # it "reverses each word, " do
      
    #   expect(@lexi.shazam([“This”, “is”, “a”, “boring”, “test”])).to eq([“sih, “se”])
    # end
  end

end