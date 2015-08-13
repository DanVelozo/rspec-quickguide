# page 45 - rspec quickguide (howto)

require 'rails_helper'

describe User do
  subject { User.new(name: 'Danilo Velozo', admin: true) }

  it 'is an instance  of User' do
    expect(subject).to be_an(User)
  end

  it 'sets name' do
    expect(subject.name).to eql('Danilo Velozo')
  end

  it 'is an admin' do
    expect(subject). to be_admin
  end

  context 'with default arguments' do
    it { should be_an(User) }
    it { should_not be_admin }

    its(:name) { should be_nil }
  end

  context 'with provided arguments' do
    subject { User.new(name: 'Danilo Velozo', admin: true) }

    it { should be_admin }
    its(:name) { should == 'Danilo Velozo' }
  end
end
