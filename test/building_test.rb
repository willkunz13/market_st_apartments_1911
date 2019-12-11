require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require_relative '../lib/renter.rb'
require_relative '../lib/apartment.rb'
require_relative '../lib/building.rb'

class BuildingTest < Minitest::Test

	def setup
		@building = Building.new
		@unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
		@unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
		@unit3 = Apartment.new({number: "C3", monthly_rent: 1150, bathrooms: 2, bedrooms: 2})
		@unit4 = Apartment.new({number: "D4", monthly_rent: 1500, bathrooms: 3, bedrooms: 2})
		@renter1 = Renter.new("Spencer")
		@renter2 = Renter.new("Jessie")
		@renter3 = Renter.new("Max")
	end

	def test_building_exists
		assert_instance_of Building, @building
	end

	def test_building_attributes
		assert_equal [], @building.units
	end
	
	def test_add_unit
		@building.add_unit(@unit1)
		@building.add_unit(@unit2)
		assert_includes @building.units, @unit1
		assert_includes @building.units, @unit2
	end

	def test_average_rent
		@building.add_unit(@unit1)
                @building.add_unit(@unit2)
		assert_equal 1099.5, @building.average_rent
	end

	def test_renter_with_highest_rent
		@building.add_unit(@unit1)
                @building.add_unit(@unit2)
		@building.add_unit(@unit3)
		@unit2.add_renter(@renter1)
		@unit1.add_renter(@renter2)
		assert_equal @renter2, @building.renter_with_highest_rent
		@unit3.add_renter(@renter3)
		assert_equal @renter2, @building.renter_with_highest_rent
	end

	
	
end

