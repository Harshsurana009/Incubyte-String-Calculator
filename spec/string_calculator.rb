# Spec for Incubyte string calculator
require 'rspec'
require File.expand_path('../lib/string_calculator', __dir__)

RSpec.describe StringCalculator do
  it 'should returns 0 for an empty string' do
    expect(StringCalculator.add('')).to eq(0)
  end
end
