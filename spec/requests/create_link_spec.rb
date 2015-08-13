require 'spec_helper'

describe 'Create link' do
  before do
    visit '/links/new'

    fill_in 'Url', with: 'http://google.com'
    click_button 'Shorten'
  end

  it 'displays long url' do
    expect(page).to have_content('http://google.com')
  end

  it 'displays shortened url' do
    expect(page.body).to match(%r[httpp://www\.example.com/[a-zA-z0-9]+])
  end
end
