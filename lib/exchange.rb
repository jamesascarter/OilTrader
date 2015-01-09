class Exchange

	attr_accessor :barrelstock

	def initialize
		@barrelstock = []
		1000.times { @barrelstock << Barrel.new}
	end

	def priceup
		barrelstock.each { |x| x.price = 50 }
	end
end