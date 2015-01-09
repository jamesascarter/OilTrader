class Exchange

	attr_accessor :barrelstock

	def initialize
		@barrelstock = []
		1000.times { @barrelstock << Barrel.new}
	end
end