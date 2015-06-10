require 'plane'

describe Plane do
  let(:plane) { Plane.new }
  it 'has a flying status when created' do
    expect(plane.status).to eq('flying')
  end

  it 'can land' do
    plane.land
    expect(plane.status).to eq('landed')
  end

  it 'can fly again when landed' do
    plane.land
    plane.take_off
    expect(plane.status).to eq('flying')
  end

  it 'cannot land a second time if it has already landed' do
    plane.land
    expect { plane.land } .to raise_error('plane already landed Genius!')
  end

  it 'cannot take off if it is already flying' do
    expect { plane.take_off } .to raise_error('plane already flying Einstein!')
  end
end
