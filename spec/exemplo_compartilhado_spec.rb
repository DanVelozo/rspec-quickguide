# page 30 - rspec quickguide (howto)

require 'rails_helper'

describe Car do
  describe 'Porshe' do
    before { @car = Car.preset(:porshe) }

    it 'should have 4 wheels' do
      expect(@car.wheels).to eql(4)
    end
  end

  describe 'Ferrari' do
    before { @car = Car.preset(:ferrari) }

    it 'should have 4 wheels' do
      expect(@car.wheels).to eql(4)
    end
  end
end

shared_examples_for 'car' do
  it 'should have 4 wheels' do
    expect(@car.wheels).to eql(4)
  end
end

describe Car do
  describe 'Porshe' do
    before { @car = Car.preset(:porshe) }
    it_behaves_like 'car'
  end

  describe 'Ferrari' do
    before { @car = Car.preset(:ferrari) }
    it_behaves_like 'car'
  end
end
