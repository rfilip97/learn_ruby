class RPNCalculator
  def initialize
    @data = []
  end

  def push(nb)
    @data.push(nb)
  end

  def plus
    raise "calculator is empty" if @data.empty?

    push(:+)
  end

  def minus
    raise "calculator is empty" if @data.empty?

    push(:-)
  end

  def times
    raise "calculator is empty" if @data.empty?

    push(:*)
  end

  def divide
    raise "calculator is empty" if @data.empty?

    push(:/)
  end

  def tokens(tokens_str)
    tokens_array = tokens_str.split
    data = []

    tokens_array.each { |token| data.push(convert_token(token)) }

    data
  end

  def convert_token(token)
    symbols = ["+", "-", "*", "/"]

    symbols.include?(token) ? token.to_sym : token.to_i
  end

  def evaluate(expression)
    @data = tokens(expression)

    value
  end

  def value
    stack = []

    @data.each do |token|
      if token.is_a?(Integer)
        stack.push(token)
      else
        x = stack.pop
        y = stack.pop

        result = calculate(y, x, token)
        stack.push(result)
      end
    end

    stack.pop
  end

  def calculate(x, y, operation)
    x = x.to_f
    y = y.to_f

    case operation
    when :+
      result = x + y
    when :-
      result = x - y
    when :*
      result = x * y
    when :/
      result = x / y
    else
      result = 0
    end

    result
  end
end
