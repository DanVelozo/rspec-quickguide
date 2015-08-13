# page 53 - rspec quickguide (howto)

require 'rails_helper'

describe 'User class' do
  it 'saves record' do
    User.any_instance.stub(:save).and_return(true)

    user = User.new
    expect(user.save).to be

    another_user = User.new
    expect(another_user.save).to be
  end
end

describe User do
  it 'raises' do
    subject.stub(:age).and_raise('Not implemented')
    expect { subject.age }.to raise_error('Not implemented')
  end

  it 'throws' do
    subject.stub(:destroy).and_throw(:destroy_record)
    expect { subject.destroy }.to throw_symbol(:destroy_record)
  end
end

describe User do
  it 'yields' do
    User.stub(:create).and_yield(subject)

    User.create do |user|
      expect(user).to eql(subject)
    end
  end
end

describe User do
  it 'returns e-mail address' do
    subject.should_receive(:email).and_return('danilo@teste.com')
    subject.should_not_receive(:name)

    expect(subject.email).to eql('danilo@teste.com')
  end
end

describe User do
  it "doesn't call #create" do
    User.should_not_receive(:create).never
    User.new
  end
end

describe User do
  it 'instantiates 1 user' do
    User.should_receive(:new).once
    User.new
  end

  it 'instantiates 3 users' do
    User.should_receive(:new).exactly(3).times
    3.times { User.new }
  end

  it 'instantiates 2 users' do
    User.should_receive(:new).twice
    2.times { User.new }
  end

  it 'instantiates at most 3 users' do
    User.should_receive(:new).at_most(3).times
    2.times { User.new }
  end

  it 'instantiates at last 2 users' do
    User.should_receive(:new).at_least(2).times
    3.times { User.new }
  end

  it 'instantiates any number of users' do
    User.should_receive(:new).any_number_of_times
    rand(3).times { User.new }
  end

  it "doesn't instantiate a user" do
    User.should_receive(:new).never
  end
end
