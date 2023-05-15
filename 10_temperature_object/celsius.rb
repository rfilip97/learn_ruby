require "temperature"

class Celsius < Temperature
  def initialize(temp)
    super(CELSIUS => temp)
  end
end
