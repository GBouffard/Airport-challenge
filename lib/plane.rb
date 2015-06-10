class Plane
  attr_reader :status
  def initialize
    @status = 'flying'
  end

  def land
    @status == 'landed' ? (fail 'plane already landed Genius!') : @status = 'landed'
  end

  def take_off
    @status == 'flying' ? (fail 'plane already flying Einstein!') : @status = 'flying'
  end
end
