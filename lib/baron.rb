class Baron

  attr_reader :name
  attr_accessor :capital, :barrels, :price_checks

  def initialize(name)
    @name = name
    @capital = 10000
    @barrels = []
    @price_checks = 20
  end

  def check_price(exchange)
    raise 'No more turns. Game over!' if self.price_checks == 0
    check_used
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
        self.capital += quoted_price
      end
    end
    self.remove_barrels(quantity)
  end

  def remove_barrels(quantity)
    self.barrels.slice!(0, quantity) 
  end

  def check_used
    self.price_checks -= 1
  end

  def sell_at_cost
    self.barrels.each{ |barrel| self.capital += barrel.price}
    self.remove_barrels(self.barrels.length)
  end

end