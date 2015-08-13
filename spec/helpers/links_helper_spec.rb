require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the LinksHelper. For example:
#
# describe LinksHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe LinksHelper, type: :helper do
  it 'returns shortened url' do
    link = mock(:link, id: 1234)
    expect(helper.shortened_url(link)).to eql('http://test.host/16i')
  end
end
