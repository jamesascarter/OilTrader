class Baron

	attr_reader :name
	attr_accessor :capital, :barrels

	def initialize(name)
		@name = name
		@capital = 10000
		@barrels = []
	end

end