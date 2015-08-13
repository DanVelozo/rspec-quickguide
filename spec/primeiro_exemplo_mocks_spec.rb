# page 49 - rspec quickguide (howto)

require 'rails_helper'

describe 'User class' do
  it 'returns name and email' do
    user = mock(:user, name: 'Danilo Velozo', email: 'danilo@teste.com')

    expect(user.name).to eql('Danilo Velozo')
    expect(user.email).to eql('danilo@teste.com')
  end
end
