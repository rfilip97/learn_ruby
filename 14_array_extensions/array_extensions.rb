class Array
  def sum
    reduce(0) { |sum, elem| sum + elem }
  end

  def square
    map { |elem| elem ** 2 }
  end

  def square!
    map! { |elem| elem ** 2 }
  end
end
