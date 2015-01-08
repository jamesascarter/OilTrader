require 'baron'

describe Baron do

	let(:baron) {Baron.new('jimmie')}

  it "should have a name" do
  	expect(baron.name).to eq('jimmie')
  end

  it "should start with a set amount of money" do
  	expect(baron.capital).to eq(10000)
  end

  it 'should be able to hold barrels' do
  	expect(baron.barrels.count).to eq(0)
  end
end
