require 'airport'

describe Airport do
  airport = Airport.new
  it 'has a default capacity' do
    expect(airport.capacity).to eq(50)
  end

  it 'can have a custom capacity' do
    heathrow = Airport.new(200)
    expect(heathrow.capacity).to eq(200)
  end

  xit 'has a control tower that knows if the weather is sunny or stormy' do
  end

  xit 'allow a plane to land if the weather is sunny' do
  end

  xit 'does not allow a plane if the weather is stormy' do
  end

  xit 'allow a plane to land if it is not full' do
  end

  xit 'does not allow a plane to land if it is full' do
  end
end
