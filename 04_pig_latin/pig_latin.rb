VOWELS = ["a", "e", "i", "o", "u"]

def vowel?(char)
  VOWELS.include?(char.downcase)
end

def begins_with_vowel?(text)
  return false if text.empty?

  vowel?(text.chr)
end

def handle_vowel_starting_word(word)
  word + "ay"
end

def handle_consonant_starting_word(word)
  tokens = piggy_tokenize(word)

  starting_consonants = tokens[0]
  tokens[1..-1].map { |char| !vowel?(char) ? starting_consonants += char : break }

  start_index = starting_consonants.length

  "#{word[start_index..-1]}#{starting_consonants}ay"
end

# Needed because in pig latin 'qu' should be considered a single token
def piggy_tokenize(word)
  tokens = []
  i = 0

  while i < word.length
    if word[i] == "q" && word[i + 1] == "u"
      tokens << word[i..i + 1]
      i += 2
    else
      tokens << word[i]
      i += 1
    end
  end

  tokens
end

def translate(text)
  tokens = text.split
  tokens.map! { |token|
    token = begins_with_vowel?(token) ?
      handle_vowel_starting_word(token) :
      handle_consonant_starting_word(token)
  }

  tokens.join(" ")
end
