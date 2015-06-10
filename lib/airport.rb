class Airport
  attr_reader :capacity, :weather, :planes
  def initialize(capacity = 50)
    @capacity = capacity
    @weather = weather
    @planes = []
  end

  def weather
    rand(10) > 2 ? 'sunny' : 'stormy'
  end

  def land(plane)
    plane.land
    @planes << plane
  end
end
