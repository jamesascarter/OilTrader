require 'market_events'

describe Market_events do
  let(:extended_class) { Class.new { extend Market_events } }

  it "works" do
    expect(extended_class.hi).to eq(1)
  end
end