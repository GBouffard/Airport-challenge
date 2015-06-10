require 'airport'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { double :plane }
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
    airport.weather(9)
    expect(plane).to receive(:land)
    airport.land(plane)
    expect(airport.planes).to eq [plane]
  end

  it 'does not allow a plane to land if the weather is stormy' do
    airport.weather(1)
    allow(plane).to receive(:land)
    expect { airport.land(plane) } .to raise_error 'Authorisation denied. Its Stormy!'
  end

  it 'allows a plane to land if it is not full' do
    airport.weather(9)
    allow(plane).to receive(:land)
    (airport.capacity - 1).times { airport.land(plane) }
    expect { airport.land(plane) }.not_to raise_error
  end

  it 'does not allow a plane to land if it is full' do
    airport.weather(9)
    allow(plane).to receive(:land)
    (airport.capacity).times { airport.land(plane) }
    expect { airport.land(plane) }.to raise_error 'Authorisation denied. The airport is full!'
  end

  it 'allows a plane to take off' do
    airport.weather(9)
    allow(plane).to receive(:land)
    airport.land(plane)
    allow(plane).to receive(:take_off)
    airport.take_off(plane)
    expect(airport.planes).to eq []
  end
end
