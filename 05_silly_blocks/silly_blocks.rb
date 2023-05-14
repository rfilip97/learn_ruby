def reverser
  default_text = yield

  tokens = default_text.split
  tokens.map { |token| token.reverse! }

  tokens.join(" ")
end

def adder(value = 1)
  default_value = yield

  default_value + value
end

def repeater(times = 1)
  times.times { yield }
end
