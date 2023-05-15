class Temperature
  FAHRENHEIT_FREEZING_POINT = 32
  FAHRENHEIT_CELSIUS_RATIO = 9.0 / 5.0

  FAHRENHEIT = :f
  CELSIUS = :c

  def initialize(**options)
    possible_keys = [CELSIUS, FAHRENHEIT]
    found_key = options.keys.find { |key| possible_keys.include?(key) }

    if found_key
      @c_temp = found_key == CELSIUS ? options[CELSIUS] : ftoc(options[FAHRENHEIT])
    else
      @c_temp = 0
    end
  end

  def self.from_celsius(temp)
    Temperature.new(CELSIUS => temp)
  end

  def self.from_fahrenheit(temp)
    Temperature.new(FAHRENHEIT => temp)
  end

  def in_celsius
    @c_temp
  end

  def in_fahrenheit
    ctof(@c_temp)
  end

  private

  def ftoc(f_temp)
    c_temp = (f_temp - FAHRENHEIT_FREEZING_POINT) / FAHRENHEIT_CELSIUS_RATIO

    c_temp.round(2)
  end

  def ctof(c_temp)
    f_temp = c_temp * FAHRENHEIT_CELSIUS_RATIO + FAHRENHEIT_FREEZING_POINT

    f_temp.round(2)
  end
end
