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
    expect { plane.land } .to raise_error('plane already landed')
  end

  xit 'cannot fly a second time if it is already flying' do
  end
end
