LITTLE_WORDS = ["a", "an", "and", "in", "of", "the"]

class Book
  attr_reader :title

  def title=(title)
    @title = titleize(title)
  end

  private

  def titleize(text)
    should_capitalize = ->(word, index) { index == 0 || !LITTLE_WORDS.include?(word) }

    tokens = text.split
    tokens.each_with_index { |token, index| should_capitalize.call(token, index) && token.capitalize! }

    tokens.join(" ")
  end
end
