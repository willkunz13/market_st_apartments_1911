class Building

	attr_reader :units
	
	def initialize
		@units = []
	end

	def add_unit(unit)
		@units << unit
	end
	
	def average_rent
		units.reduce(0) { |sum, unit| sum.to_f + unit.monthly_rent} / units.count
	end
	def renter_with_highest_rent
		units.max { |unit , unit2| unit.monthly_rent <=> unit2.monthly_rent}.renter
	end
end
