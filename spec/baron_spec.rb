require 'baron'

describe Baron do

  let(:baron) {Baron.new('jimmie')}
  let(:exchange) {double :exchange, barrelstock: [barrel]}
  let(:barrel) {double :barrel, price: 50}

  it "should have a name" do
    expect(baron.name).to eq('jimmie')
  end

  it "should start with a set amount of money" do
    expect(baron.capital).to eq(10000)
  end

  it 'should be able to hold barrels' do
    expect(baron.barrels.count).to eq(0)
  end

  it 'should be able to check the price of a barrel' do
    allow(exchange).to receive(:quote) { 20 }
    expect(baron.check_price(exchange)).to eq(20)
  end

  it 'should be able to buy a barrel of oil' do
    allow(exchange).to receive(:lose_barrel)
    baron.buy(exchange, 50)
    expect(baron.barrels.count).to eq(1)
  end

  it 'should be charged for a barrel of oil' do
    allow(exchange).to receive(:lose_barrel)
    baron.buy(exchange, 50)
    expect(baron.capital).to eq(9950)
  end

end
