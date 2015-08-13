# page 43 - rspec quickguide (howto)

require 'rails_helper'
# modulo
module PerformanceMatcher
  # class do modulo
  class TakeLessThan
    def initialize(time)
      @time = time
    end

    def matches?(block)
      @block = block

      started = Time.now
      block.call
      @elapsed = Time.now.to_f - started.to_f
      @elapsed < (@unit == :minutes ? @time * 60 : @time)
    end

    def seconds
      @unit = :seconds
      self
    end

    def minutes
      @unit = :minutes
      self
    end

    def failure_message_for_should
      "expected #{@block.inspect} to take less than #{@time} #{@unit}"
    end

    def failure_message_for_should_not
      "expected #{@block.inspect} to take more than #{@time} #{@unit}"
    end
  end

  def take_less_than
    TakeLessThan.new(time)
  end
end

RSpec.configure { |c| c.include(PerformanceMatcher) }
