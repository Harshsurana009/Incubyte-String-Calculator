# Spec for Incubyte string calculator
require 'rspec'
require File.expand_path('../lib/string_calculator', __dir__)

RSpec.describe StringCalculator do
  it 'should returns 0 for an empty string' do
    expect(StringCalculator.add('')).to eq(0)
  end

  it 'Should return same number when single number given' do
    expect(StringCalculator.add('1')).to eq(1)
  end

  it 'Should returns the sum of two numbers' do
    expect(StringCalculator.add('1,2')).to eq(3)
  end

  it 'Should returns the sum of multiple numbers' do
    expect(StringCalculator.add('1,2,5')).to eq(8)
  end

  it 'Should handles new lines between numbers' do
    expect(StringCalculator.add("1\n2,3")).to eq(6)
  end
end
