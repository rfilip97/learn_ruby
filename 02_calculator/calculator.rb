def add(x, y)
  x + y
end

def subtract(x, y)
  x - y
end

def sum(numbers)
  numbers.length == 0 ? 0 : numbers.reduce(0) { |sum, nb| sum + nb }
end

def multiply(x, y)
  x * y
end

def multiply_array(numbers)
  numbers.length == 0 ? 0 : numbers.reduce(1) { |prod, nb| prod * nb }
end

def power(x, y)
  x ** y
end

def factorial(nb)
  fact = ->(nb) { (1..nb).reduce(1) { |fact, nb| fact * nb } }

  nb < 1 ? 1 : fact.call(nb)
end
