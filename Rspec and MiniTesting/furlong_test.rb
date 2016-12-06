#Mini Test and Rspec does the same work but its on you 
#what you like but Rspec got more popularity and more support

require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/spec'
require './furlong'



#Rspec is a testing DSL and minitest is ruby

class FurlongTest < MiniTest::Unit::TestCase
	def test_one_mile
		km = Furlong.new.miles_to_kilometers(1)
		assert_in_delta 1.60934, km, 0.001	
	end

	def test_marathon
		km = Furlong.new.miles_to_kilometers(26.219)
		assert_in_delta 42.195, km, 0.001
	end
end

#Rspec Testing
describe Furlong do
	let(:calculator) { Furlong.new }

	it "converts 1 mile to 1.60934 km" do
		calculator.miles_to_kilometers(1).must_be_within_delta(1.60934, 0.001)
	end
	
end
