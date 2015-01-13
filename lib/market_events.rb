module Market_events

	def market_conditions
		climate = rand(0..10)
		climate <= 3 ? "crash" : "normal"
	end


end