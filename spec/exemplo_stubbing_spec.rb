# page 51 - rspec quickguide (howto)

require 'rails_helper'

describe User do
  it 'returns email' do
    subject.stub email: 'danilo@teste.com'
    expect(subject.email).to eql('danilo@teste.com')
  end

  it 'returns no e-mail' do
    subject.stub :email
    expect(subject.email).to be_nil
  end

  it 'overrides implementation' do
    subject.stub(:email) do
      'danilo@teste.com'
    end

    expect(subject.email).to eql('danilo@teste.com')
  end

  it 'returns several attributes' do
    subject.stub email: 'danilo@teste.com', name: 'Danilo Velozo'

    expect(subject.email).to eql('danilo@teste.com')
    expect(subject.name).to eql('Danilo Velozo')
  end
end
