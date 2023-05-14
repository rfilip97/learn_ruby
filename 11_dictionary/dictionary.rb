class Dictionary
  attr_reader :entries

  def initialize
    @entries = {}
  end

  def add(entry)
    entry.is_a?(String) ? @entries[entry] = nil : @entries.merge!(entry)
  end

  def keywords
    @entries.keys.sort
  end

  def include?(key)
    @entries.key?(key)
  end

  def find(prefix)
    found = {}

    @entries.each do |key, value|
      if key.start_with?(prefix)
        found[key] = value
      end
    end

    found
  end

  def printable
    output = ""
    sorted_hash = @entries.sort.to_h

    sorted_hash.each { |key, value| output += "[#{key}] \"#{value}\"\n" }

    output.chop
  end
end
