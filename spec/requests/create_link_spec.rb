require 'spec_helper'

describe 'Create link' do
  before do
    visit '/links/new'

    fill_in 'Url', with: 'http://google.com'
    click_button 'Shorten'
  end

  it 'displays long url'

  it 'displays shortened url'
end
