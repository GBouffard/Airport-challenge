require 'plane'

describe Plane do
  plane = Plane.new
  it 'has a flying status when created' do
    expect(plane.status).to eq('flying')
  end

  it 'can land' do
    plane.take_off
    expect(plane.status).to eq('landed')
  end

  xit 'can fly again when landed' do
  end

  xit 'cannot land a second time if it has already landed' do
  end

  xit 'cannot fly a second time if it is already flying' do
  end
end
