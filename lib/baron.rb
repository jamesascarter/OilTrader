class Baron

  attr_reader :name
  attr_accessor :capital, :barrels

  def initialize(name)
    @name = name
    @capital = 10000
    @barrels = []
  end

  def check_price(exchange)
    exchange.quote
  end

  def buy(exchange, quoted_price)
    exchange.barrelstock.each do |barrel| 
      if barrel.price == quoted_price && self.capital >= barrel.price
        self.barrels << barrel
        self.capital -= barrel.price
      end
    end
    exchange.lose_barrel(quoted_price)
  end

  def sell(exchange, quoted_price, quantity)
    self.barrels.each_with_index do |barrel, index|
      if index < quantity
        exchange.barrelstock << barrel
      end
    end
  end

end