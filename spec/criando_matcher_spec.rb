# page 42 - rspec quickguide (howto)

require 'rails_helper'

RSpec::Matchers.define :be_multiple_of do |expected|
  match do |actual|
    actual % expected == 0
  end

  describe 'Matchers' do
    it 'is multiple of 3' do
      expect(9).to be_multiple_of(3)
    end

    it 'is multiple of 4' do
      expect(8).to be_multiple_of(4)
    end
  end

  failure_message_for_should do |actual|
    'expected #{actual} do be multiple of #{expected}'
  end

  failure_message_for_should_not do |actual|
    'expected #{actual} not to be multiple of #{expected}'
  end

  description do
    'be multiple of #{expected}'
  end
end
