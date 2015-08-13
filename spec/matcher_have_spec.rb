# page 41- rspec quickguide (howto)

require 'rails_helper'

post = Post.new

expect(post).to have(:no).comments

post.comments += ['comment 1', 'comment 2']

expect(post).to have(2).comments
expect(post).to have_exactly(2).comments
expect(post).to have_at_least(2).comments
expect(post).to have_at_most(2).comments


# O rspec também implementa algumas sintaxes puramente cosméticas em arrays e strings, respondendo aos matchers items() e
# characters().

expect([]).to have(:no).items
expect([]).to have(0).items
expect([1]).to have(1).item
expect([1, 2]).to have(2).items

expect('').to have(:no).characters
expect('hello').to have(5).characters
expect('h').to have(1).character
