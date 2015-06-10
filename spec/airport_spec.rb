require 'airport'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { double :plane }
  before do
    airport.weather(9)
    allow(plane).to receive(:land)
    allow(plane).to receive(:take_off)
  end

  it 'has a default capacity' do
    expect(airport.capacity).to eq(50)
  end

  it 'can have a custom capacity' do
    heathrow = Airport.new(200)
    expect(heathrow.capacity).to eq(200)
  end

  it 'control tower knows if the weather is sunny or stormy' do
    expect(airport.weather).to satisfy { 'sunny' || 'stormy' }
  end

  it 'can allow a plane to land' do
    airport.land(plane)
    expect(airport.planes).to eq [plane]
  end

  it 'does not allow a plane to land if the weather is stormy' do
    airport.weather(1)
    expect { airport.land(plane) } .to raise_error 'Authorisation denied. Its Stormy!'
  end

  it 'allows a plane to land if it is not full' do
    (airport.capacity - 1).times { airport.land(plane) }
    expect { airport.land(plane) }.not_to raise_error
  end

  it 'does not allow a plane to land if it is full' do
    (airport.capacity).times { airport.land(plane) }
    expect { airport.land(plane) }.to raise_error 'Authorisation denied. The airport is full!'
  end

  it 'allows a plane to take off' do
    airport.land(plane)
    airport.take_off(plane)
    expect(airport.planes).to eq []
  end

  it 'does not allow a plane to take off if the weather is stormy' do
    airport.land(plane)
    airport.weather(1)
    expect { airport.take_off(plane) }.to raise_error 'Authorisation denied. Its Stormy!'
  end

  it 'cannot allow a place to take off if it never landed in the airport' do
    expect { airport.take_off(plane) }.to raise_error 'This plane is not in this airport!'
  end
end
