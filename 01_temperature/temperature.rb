FAHRENHEIT_FREEZING_POINT = 32
FAHRENHEIT_CELSIUS_RATIO = 9.0 / 5.0

def ftoc(f_temp)
  c_temp = (f_temp - FAHRENHEIT_FREEZING_POINT) / FAHRENHEIT_CELSIUS_RATIO

  c_temp.round(2)
end

def ctof(c_temp)
  f_temp = c_temp * FAHRENHEIT_CELSIUS_RATIO + FAHRENHEIT_FREEZING_POINT

  f_temp.round(2)
end
