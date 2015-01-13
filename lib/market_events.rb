module Market_events

	def market_conditions
		climate = rand(0..10)
			if climate <= 3
				'crash'
			elsif climate >= 7
				'peak'
			else
				'normal'
			end
	end

end