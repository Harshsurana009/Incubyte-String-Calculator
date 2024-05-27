# frozen_string_literal: true

# lib/string_calculator.rb
class StringCalculator
  def self.add(input)
    return 0 if input.empty?

    numbers = if input.start_with?('//')
                delimiter, input = input[2..-1].split("\n", 2)
                input.split(delimiter).map(&:to_i)
              else
                input.split(/,|\n/).map(&:to_i)
              end

    numbers.sum
  end
end
