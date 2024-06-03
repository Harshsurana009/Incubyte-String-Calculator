# Spec for Incubyte string calculator
require 'rspec'
require File.expand_path('../lib/string_ccalculator', __dir__)

RSpec.describe StringCalculator do
  let(:calculator) { StringCalculator.new }

  it 'should returns 0 for an empty string' do
    expect(calculator.add('')).to eq(0)
  end

  it 'Should return same number when single number given' do
    expect(calculator.add('1')).to eq(1)
  end

  it 'Should returns the sum of two numbers' do
    expect(calculator.add('1,2')).to eq(3)
  end

  it 'Should returns the sum of multiple numbers' do
    expect(calculator.add('1,2,5')).to eq(8)
  end

  it 'Should handles new lines between numbers' do
    expect(calculator.add("1\n2,3")).to eq(6)
  end

  it 'Should supports different delimiters' do
    expect(calculator.add("//;\n1;2")).to eq(3)
  end

  context 'when input contains negative numbers' do
    before do
      calculator.add_validation do |num|
        raise "Negative numbers not allowed: #{num}" if num < 0
      end
    end

    it 'Should raises an error for negative numbers' do
      expect { calculator.add('1,-2,3') }.to raise_error('Negative numbers not allowed: -2')
    end
  end

  context 'when input contains even numbers and even numbers are not allowed' do
    before do
      calculator.add_validation do |num|
        raise "Even numbers not allowed: #{num}" if num.even?
      end
    end

    it 'Should raises an error for even numbers' do
      expect { calculator.add('1,2,3') }.to raise_error('Even numbers not allowed: 2')
    end
  end

  context 'Should when input contains prime numbers and prime numbers are not allowed' do
    before do
      calculator.add_validation do |num|
        def prime?(num)
          return false if num <= 1

          (2..Math.sqrt(num)).none? { |i| num % i == 0 }
        end

        raise "Prime numbers not allowed: #{num}" if prime?(num)
      end
    end

    it 'Should raises an error for prime numbers' do
      expect { calculator.add('2,3,5') }.to raise_error('Prime numbers not allowed: 2')
    end
  end
end
