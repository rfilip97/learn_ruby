LITTLE_WORDS = ["and", "of", "for", "over", "the"]

def echo(text)
  text
end

def shout(text)
  text.upcase
end

def repeat(text, repeat = 2)
  repeated = ""

  repeat.times { repeated += "#{text} " }

  repeated.chop
end

def start_of_word(word, nb_of_letters = 1)
  word.strip[0...nb_of_letters]
end

def first_word(text)
  text.split.first
end

def titleize(text)
  should_capitalize = ->(word, index) { index == 0 || !LITTLE_WORDS.include?(word) }

  tokens = text.split
  tokens.each_with_index { |token, index| should_capitalize.call(token, index) && token.capitalize! }

  tokens.join(" ")
end
