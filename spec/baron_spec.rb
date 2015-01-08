require 'baron'

describe Baron do

  it "should have a name" do
  	baron = Baron.new('jimmie')
  	expect(baron.name).to eq('jimmie')
  end


end
