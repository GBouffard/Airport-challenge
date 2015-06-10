class Plane
  attr_reader :status
  def initialize
    @status = 'flying'
  end

  def land
    @status == 'landed' ? (fail 'plane already landed') : @status = 'landed'
  end

  def take_off
    @status = 'flying'
  end
end
