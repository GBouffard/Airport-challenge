class Airport
  attr_reader :capacity, :planes
  def initialize(capacity = 50)
    @capacity = capacity
    @planes = []
  end

  def weather(cheat = nil)
    value = (!cheat.nil? ? cheat : rand(10))
    @weather = (value > 2 ? 'sunny' : 'stormy')
  end

  def land(plane)
    if @weather == 'sunny'
      plane.land
      @planes << plane
    else
      fail 'Authorisation denied. Its Stormy!'
    end
  end
end
