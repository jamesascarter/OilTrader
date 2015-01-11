class Exchange

  attr_accessor :barrelstock

  def initialize
    @barrelstock = []
    1000.times { @barrelstock << Barrel.new}
    self.apply_market_price
  end

  def apply_market_price
    barrelstock.each { |x| x.price = market_pricer }
  end

  def market_pricer
    Random.rand(100 - 0)
  end

  def quote
    barrelstock[market_pricer].price
  end 

  def lose_barrel(quoted_price)
    barrelstock.delete_if {|barrel| barrel.price == quoted_price}
  end

  def quantity_for_sale(price)
    barrelstock.select{|barrel| barrel.price == price}
  end


end