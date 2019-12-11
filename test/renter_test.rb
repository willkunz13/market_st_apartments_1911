require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require_relative '../lib/renter.rb'

class RenterTest < Minitest::Test

	def setup
		@renter1 = Renter.new("Jessie")
	end

	def test_renter_exists
		assert_instance_of Renter, @renter1
	end

	def test_renter_attributes
		assert_equal "Jessie", @renter1.name
	end
end
