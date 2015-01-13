require 'market_events'

describe Market_events do
  let(:extended_class) { Class.new { extend Market_events } }

  it "can produce a condition from normal or crash" do
    expect(extended_class.market_conditions).to match(/normal|crash/)
    puts extended_class.market_conditions
  end

end