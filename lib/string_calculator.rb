# frozen_string_literal: true

# lib/string_calculator.rb

# users can add their custom validations to the calculator
# Ex: calculator = StringCalculator.new
# calculator.add_validation do |num|
#   raise "Negative numbers not allowed: #{num}" if num < 0
# end

class StringCalculator
  def initialize
    @validations = []
  end

  def add(input)
    return 0 if input.empty?

    numbers = extract_numbers(input)
    check_validity_of_input(numbers)

    numbers.sum
  end

  def add_validation(&block)
    @validations << block
  end

  private

  def check_validity_of_input(numbers)
    numbers.each do |num|
      @validations.each do |validation|
        validation.call(num.to_i)
      end
    end
  end

  def extract_numbers(input)
    delimiter, numbers = extract_delimiter_and_number(input)

    delimiter.nil? ? input.split(/,|\n/).map(&:to_i) : numbers.split(delimiter).map(&:to_i)
  end

  def extract_delimiter_and_number(input)
    input.start_with?('//') ? input[2..-1].split("\n", 2) : [nil, input]
  end
end
