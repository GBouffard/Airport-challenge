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
    if @weather == 'sunny' && @planes.length < @capacity
      plane.land
      @planes << plane
    elsif @capacity <= @planes.length
      fail 'Authorisation denied. The airport is full!'
    else
      fail 'Authorisation denied. Its Stormy!'
    end
  end

  def take_off(plane)
    if @weather == 'sunny'
      plane.take_off
      @planes.delete(plane)
    else
      fail 'Authorisation denied. Its Stormy!'
    end
  end
end
