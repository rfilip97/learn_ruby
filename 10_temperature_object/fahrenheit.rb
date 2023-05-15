require "temperature"

class Fahrenheit < Temperature
  def initialize(temp)
    super(FAHRENHEIT => temp)
  end
end
