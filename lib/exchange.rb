require_relative './market_events'

class Exchange

  include Market_events

  attr_accessor :barrelstock

  def initialize
    @barrelstock = []
    1000.times { @barrelstock << Barrel.new}
    self.apply_market_price
  end

  def apply_market_price
    barrelstock.each { |barrel| barrel.price = market_pricer }
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

  def market_eventer
    if market_conditions = "crash"
      barrelstock.each {|barrel| barrel.price *= 0.5}
    end
  end 


end