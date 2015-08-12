# page 21 - rspec quickguide (howto)

require 'rails_helper'

describe 'Numbers' do
  it 'should returns even numbers' do
    numbers = (0..10).select { |n| n % 2 == 1 }
    expect(numbers).to eql([1, 3, 5, 7, 9])
  end
end

describe 'Numbers' do
  focus 'should returns multiples of 5' do
    numbers = (0..10).select { |n| n % 5 == 0 }
    expect(numbers).to eql([0, 5, 10])
  end
end

describe 'Numbers' do
  xit 'should return multiples of 10' do
    (0..100).select { |n| n % 10 == 0 }
  end

  pending 'should return multiples of 8' do
    (0..24).select { |n| n % 8 == 0 }
  end
end
