require 'rspec'
require './furlong'

describe Furlong do
	#Here is how you write if its common
	#let(:calculator){Furlong.new}

	it "converts 1 mile to 1.60934 km" do
		#You can define this "calc = Furlong.new" or take it out 
		km = subject.miles_to_kilometers(1)
		#Should is an older version of Rspec, Latest versions uses expect   
		#km.should eq(1.60934)
		#expect(km).to eq(1.60934)
	
		km.should be_within(0.0001).of(1.60934)
	end

	it "converts a marathon: 26.219 miles to 42.194988" do
		#calc = Furlong.new
		km = subject.miles_to_kilometers(26.219)
		km.should be_within(0.01).of(42.195288)
	end

end
