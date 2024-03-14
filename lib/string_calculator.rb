# frozen_string_literal: true

class StringCalculator
  class NegativeNumberError < StandardError; end
  class InvalidInputError < StandardError; end

  DEFAULT_DELIMITER = ','
  CUSTOM_DELIMITER = '//'

  attr_reader :str

  def initialize(str)
    @str = str.to_s
  end

  def add
    return 0 if str.empty?

    set_delimiter
    set_digits
    raise_if_negatives

    @digits.sum
  end

  private

  def raise_if_negatives
    negative_digits = @digits.select(&:negative?)

    raise NegativeNumberError, "Negative digits are not allowed: #{negative_digits.join(', ')}" if negative_digits.any?
  end

  def set_digits
    modified_str = str.split(@delimiter, -1).map(&:strip).join(@delimiter)
    @digits = modified_str.gsub("\n", @delimiter).split(@delimiter, -1)

    raise InvalidInputError, 'Invalid input error' if @digits.include?('')

    @digits.map!(&:to_i)
  end

  def set_delimiter
    @delimiter = str.start_with?(CUSTOM_DELIMITER) ? str[2] : DEFAULT_DELIMITER
  end
end
