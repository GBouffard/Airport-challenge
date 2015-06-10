class Plane
  attr_reader :status
  def initialize
    @status = 'flying'
  end

  def take_off
    @status = 'landed'
  end
end
