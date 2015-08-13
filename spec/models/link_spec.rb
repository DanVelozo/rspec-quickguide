require 'rails_helper'

RSpec.describe Link, type: :model do
  context 'validations' do
    it 'requires url to be set' do
      link = Link.create
      expect(link).to have(1).error_on(:url)
    end

    it 'is valid with valid url' do
      link = Link.create(url: 'http://exemplo.com')
      expect(link).to have(:no).errors_on(:url)
    end

    it 'is not valid when url is invalid' do
      link = Link.create(url: 'invalid')
      expect(link).to have(1).errors_on(:url)
    end
  end
end
