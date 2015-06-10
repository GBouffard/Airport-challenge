require 'capybara/rspec'
require 'airport'
require 'plane'

# Makers Academy Grand finale:
# Given 6 planes, each plane must land.
# Check when all the planes have landed that they have status "landed"
# Once all planes are in the air again, check that they have status "flying!"

feature 'Grand Finale' do
  airport = Airport.new
  planes = [Plane.new, Plane.new, Plane.new, Plane.new, Plane.new, Plane.new]
  airport.weather('sunny')
  scenario 'all planes can land' do
    planes.each { |plane| airport.land plane }
    expect(airport.planes).to eq planes
    expect(airport.planes.map(&:status).uniq).to eq ['landed']
  end

  xscenario 'all planes can take off' do
  end
end
