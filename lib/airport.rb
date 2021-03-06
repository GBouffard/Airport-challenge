class Airport
  attr_reader :capacity, :planes
  def initialize(capacity = 50)
    @capacity = capacity
    @planes = []
  end

  def weather(cheat = nil)
    random = (rand(10) > 2 ? 'sunny' : 'stormy')
    @weather = (!cheat.nil? ? cheat : random)
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
    if @weather == 'sunny' && @planes.include?(plane)
      plane.take_off
      @planes.delete(plane)
    elsif @weather == 'sunny'
      fail 'This plane is not in this airport!'
    else
      fail 'Authorisation denied. Its Stormy!'
    end
  end
end
