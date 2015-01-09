class Exchange

	attr_accessor :barrelstock

	def initialize
		@barrelstock = []
	end

	def stock(barrel)
		1000.times { @barrelstock << barrel = Barrel.new}
	end

end