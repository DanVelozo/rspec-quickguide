require 'rails_helper'

RSpec.describe 'links/show.html.erb', type: :view do
  before do
    assign :link, mock(:link, url: 'http://google.com', id: 1234)
    render
  end
  it 'displays original link' do
    expect(rendered).to match('http://google.com')
  end

  it 'displays shortened link' do
    expect(rendered).to match('http://test.host/16i')
  end
end
