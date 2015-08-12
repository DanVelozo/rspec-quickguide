# page 28 - rspec quickguide (howto)

require 'rails_helper'

# definindo modulo
module UserHelpers
  def create_user
    User.new(name: 'Danilo Velozo', email: 'danilo@teste.com').tap(&:save)
  end
end

describe User do
  include UserHelpers

  it 'should set name' do
    user = create_user
    expect(user.name).to eql('Danilo Velozo')
  end

  it 'should set e-mail' do
    user = create_user
    expect(user.email).to eql('danilo@teste.com')
  end
end
