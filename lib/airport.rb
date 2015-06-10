class Airport
  attr_reader :capacity, :weather
  def initialize(capacity = 50)
    @capacity = capacity
    @weather = weather
  end

  def weather
    rand(10) > 2 ? 'sunny' : 'stormy'
  end
end
