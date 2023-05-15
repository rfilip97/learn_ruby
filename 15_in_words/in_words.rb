require "words"

class Integer
  def in_words
    trillion_to_w(self)
  end

  private

  def is_zero(nb)
    nb == Words::DIGITS[0]
  end

  def digit_to_w(nb)
    Words::DIGITS[nb % 10]
  end

  def ten_to_w(nb)
    digit = digit_to_w(nb)
    ten = nb % 100

    return digit if ten < 10

    if (11..19).include?(ten)
      return Words::TEENS[ten]
    end

    result = Words::TENS[ten / 10 * 10]
    result = "#{result} #{digit}" unless is_zero(digit)

    result
  end

  def hundred_to_w(nb)
    ten = ten_to_w(nb)
    hundred = nb % 1_000

    return ten if hundred < 100

    result = "#{Words::DIGITS[hundred / 100]} #{Words::HUNDRED}"
    result = "#{result} #{ten}" unless is_zero(ten)

    result
  end

  def thousand_to_w(nb)
    hundred = hundred_to_w(nb)
    thousand = nb % 1_000_000

    return hundred if thousand < 1_000

    thousand = hundred_to_w(thousand / 1_000)

    result = "#{thousand} #{Words::THOUSAND}"
    result = "#{result} #{hundred}" unless is_zero(hundred)

    result
  end

  def million_to_w(nb)
    thousand = thousand_to_w(nb)
    million = nb % 1_000_000_000

    return thousand if million < 1_000_000

    million = hundred_to_w(million / 1_000_000)

    result = "#{million} #{Words::MILLION}"
    result = "#{result} #{thousand}" unless is_zero(thousand)

    result
  end

  def billion_to_w(nb)
    million = million_to_w(nb)
    billion = nb % 1_000_000_000_000

    return million if billion < 1_000_000_000

    billion = hundred_to_w(billion / 1_000_000_000)

    result = "#{billion} #{Words::BILLION}"
    result = "#{result} #{million}" unless is_zero(million)

    result
  end

  def trillion_to_w(nb)
    billion = billion_to_w(nb)
    trillion = nb % 1_000_000_000_000_000

    return billion if trillion < 1_000_000_000_000

    trillion = hundred_to_w(trillion / 1_000_000_000_000)

    result = "#{trillion} #{Words::TRILLION}"
    result = "#{result} #{billion}" unless is_zero(billion)

    result
  end
end
