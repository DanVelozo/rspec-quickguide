# page 42 - rspec quickguide (howto)

require 'rails_helper'

RSpec::Matchers.define :take_less_than do |time|
  match do |block|
    started = Time.now
    block.call
    elapsed = Time.now.to_f - started.to_f

    elapsed < (@unit == :minutes ? time.to_f * 60 : time.to_f)
  end

  chain :seconds do
    @unit = :seconds
  end

  chain :minutes do
    @unit = :minutes
  end
end
